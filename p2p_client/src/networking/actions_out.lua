MP.send = {}

local cached_username = nil

function MP.networking.initialize()
	if not MP.networking.NETWORKING_THREAD then
		local SOCKET = load_mp_file("src/networking/server.lua")
		MP.networking.NETWORKING_THREAD = love.thread.newThread(SOCKET)
		MP.networking.NETWORKING_THREAD:start(
			SMODS.Mods["Multiplayer"].config.server_url,
			SMODS.Mods["Multiplayer"].config.server_port
		)

		MP.send.connect()
	end
end

function MP.send.raw(msg)
	MP.send_trace_message("Sending message: " .. msg)
	MP.networking.ui_to_network_channel:push(msg)
end

function MP.send.connect()
	MP.send.raw("connect")

	cached_username = G.PROFILES[G.SETTINGS.profile].name or "Guest"
	MP.send.raw(MP.serialize_networking_message({
		action = "connect",
		username = cached_username,
	}))
end

function MP.send.open_lobby()
	MP.send.raw(MP.serialize_networking_message({
		action = "open_lobby",
	}))
end

function MP.send.join_lobby(code, checking)
	MP.send.raw(MP.serialize_networking_message({
		action = "join_lobby",
		code = code:gsub("[oO]", "0"), -- Replaces the letter O with the number 0 because Balatro has a vendetta against zeros
		checking = checking or false,
	}))
end

function MP.send.leave_lobby()
	MP.send.raw(MP.serialize_networking_message({
		action = "leave_lobby",
	}))
end

function MP.send.set_username()
	local new_username = G.PROFILES[G.SETTINGS.profile].name or "Guest"
	if cached_username == new_username then
		return
	end
	cached_username = new_username
	MP.send.raw(MP.serialize_networking_message({
		action = "set_username",
		username = new_username,
	}))
end
