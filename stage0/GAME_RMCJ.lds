/*  Copyright 2019  Dexter Gerig  <dexgerig@gmail.com>
    
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

// GAME_RMCJ.lds file by Leseratte

OUTPUT_FORMAT("elf32-powerpc")
OUTPUT_ARCH(powerpc:common)

ENTRY(_start)

SECTIONS {
	/* Adjust app specific settings here. */
	sdp_cb = 0x803398c0;
	l2cb = 0x80338cc0;
	switch_addr = 0x80286348;
	switch_break = 0x8014d800;
	payload_addr = 0x808dc538;
	
	. = (0x80001800 - 0xc);
	dest = (. + 0xc);
	.app_settings : {
		LONG(sdp_cb)
		LONG(l2cb)
		LONG(switch_addr)
	}

	.start : {
		stage0.o(*)
	}
}

