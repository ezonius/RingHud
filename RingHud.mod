return {
	run = function()
		fassert(rawget(_G, "new_mod"), "RingHud encountered an error loading the Darktide Mod Framework.")

		-- Define a global helper for safe loading to be available before mod init
		_G.RingHud_cached_io_dofile = function(mod, file_path)
			_G.RingHud_io_dofile_cache = _G.RingHud_io_dofile_cache or {}
			local cached = _G.RingHud_io_dofile_cache[file_path]
			if cached ~= nil then
				return cached
			end
			local result = mod:io_dofile(file_path)
			_G.RingHud_io_dofile_cache[file_path] = result
			return result
		end

		local mod = new_mod("RingHud", {
			mod_script       = "RingHud/scripts/mods/RingHud/RingHud",
			mod_data         = "RingHud/scripts/mods/RingHud/RingHud_data",
			mod_localization = "RingHud/scripts/mods/RingHud/RingHud_localization",
		})
	end,
	packages = {},
}
