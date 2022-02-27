-- EmmyLua typedef for GrandMA2 Lua API
--
-- This code is freely distributable under the terms of the [MIT license]
-- Copyright (c) 2022 Nick N. Zinovenko


---@meta
---@class gma_api
---@field gui table
---@field show table
---@field user table
---@field network table
---@field canbus table
gma = {}

---@param seconds number
function gma.sleep(seconds) end

---Print to System Monitor console
function gma.echo(...) end

---Print to Command Line feedback
function gma.feedback(...) end

---Execute GrandMA2 Command Line
---@param command string
---@return string? errmsg
function gma.cmd(command) end

---@return string -- eg "Jan 01 2021"
function gma.build_date() end

---@return string -- eg "22:22:22"
function gma.build_time() end

---@return string
function gma.git_version() end

---@return string -- eg "GMA2" or "GMA3"
function gma.gethardwaretype() end

--#region CanBus

---@param keycode number
---@param pressed boolean
---@param hold boolean
---@return boolean success
function gma.canbus.hardkey(keycode, pressed, hold) end

---@param encoder number
---@param steps number -- use negative numbers to invert direction
---@param pressed boolean
---@return boolean success
function gma.canbus.encoder(encoder, steps, pressed) end

---@param steps number -- use negative numbers to invert direction
---@return boolean success
function gma.canbus.wheel(steps) end

---@param x_axis number
---@param y_axis number
---@return boolean success
function gma.canbus.ball(x_axis, y_axis) end

--#endregion CanBus

--#region Data ImportExport

--- Export Lua table to Xml file
---@param filename string
---@param data table
function gma.export(filename, data) end

--- Export Lua table to Csv file
---@param filename string
---@param data table
function gma.export_csv(filename, data) end

--- Export Lua table to Json file
---@param filename string
---@param data table
function gma.export_json(filename, data) end

--- Import Xml file to Lua table
---@param filename string
---@param subfolder? string
---@return table data
function gma.import(filename, subfolder) end

--#endregion Data ImportExport

--#region Timer

---@param callback function
---@param timeout number
---@param max_count number
---@param cleanup? function
function gma.timer(callback, timeout, max_count, cleanup) end

---@return number system_time -- unix timestamp
function gma.gettime() end

--#endregion Timer

--#region GUI

--- Show input dialog
---@param title string
---@param placeholder? string
---@return string result
function gma.textinput(title, placeholder) end

---Show confirm dialog
---@param title string
---@param message string
---@return boolean result
function gma.gui.confirm(title, message) end

---Show messagebox dialog
---@param title string
---@param message string
---@return boolean result
function gma.gui.msgbox(title, message) end

---Show Progressbar -- must be stopped by Lua code somewhere
---@param name string
---@return number handle
function gma.gui.progress.start(name) end

---Stop Progressbar
---@param handle number
function gma.gui.progress.stop(handle) end

---@param handle number
---@param text string
function gma.gui.progress.settext(handle, text) end

---@param handle number
---@param from number
---@param to number
function gma.gui.progress.setrange(handle, from, to) end

---@param handle number
---@param value number
function gma.gui.progress.set(handle, value) end

--#endregion GUI

--#region DMX

---@param dmx_addr number
---@return number value
function gma.show.getdmx(dmx_addr) end

---@param recycle table
---@param dmx_addr number
---@param amount number
---@return number[] values
function gma.show.getdmx(recycle, dmx_addr, amount) end

--#endregion DMX

--#region Objects

---@param name string -- eg: 'Fixture 123.1', 'Group 456', 'Sequence 789'
---@return integer handle
function gma.show.getobj.handle(name) end

---@param handle integer
---@return integer handle
function gma.show.getobj.handle(handle) end

---@param handle integer
---@return string classname
function gma.show.getobj.class(handle) end

---@param handle integer
---@return number index
function gma.show.getobj.index(handle) end

---@param handle integer
---@return number commandline_number
function gma.show.getobj.number(handle) end

---@param handle integer
---@return string name
function gma.show.getobj.name(handle) end

---@param handle integer
---@return string|nil label -- returns nil if object has no label set
function gma.show.getobj.label(handle) end

---@param handle integer
---@return integer children -- amount of childs
function gma.show.getobj.amount(handle) end

---@param handle integer
---@param index integer
---@return integer child_handle
function gma.show.getobj.child(handle, index) end

---@param handle integer
---@return integer parent_handle
function gma.show.getobj.parent(handle) end

---@param handle integer
---@return boolean result
function gma.show.getobj.verify(handle) end

---@param handle1 integer
---@param handle2 integer
---@return boolean result
function gma.show.getobj.compare(handle1, handle2) end

---@return integer object_handle
function gma.user.getcmddest() end

---@return integer object_handle
function gma.user.getselectedexec() end

--#endregion Objects

--#region Property

---@param handle integer
---@return integer amount
function gma.show.property.amount(handle) end

---@param handle integer
---@param index integer
---@return string name
function gma.show.property.name(handle, index) end

---@param handle integer
---@param index integer
---@return string value
function gma.show.property.get(handle, index) end

---@param handle integer
---@param name string
---@return string value
function gma.show.property.get(handle, name) end

---@param handle integer
---@param index integer
---@param value string
---@return boolean success
function gma.show.property.set(handle, index, value) end

---@param handle integer
---@param name string
---@param value string
---@return boolean success
function gma.show.property.set(handle, name, value) end

--#endregion Property

--#region Variables

---@param var_name string
---@return string value
function gma.show.getvar(var_name) end

---@param var_name string
---@param value string
function gma.show.setvar(var_name, value) end

---@param uservar_name string
---@return string value
function gma.user.getvar(uservar_name) end

---@param uservar_name string
---@param value string
function gma.user.setvar(uservar_name, value) end

--#endregion Variables

--#region Network

---@return string host_type -- eg "Console"
function gma.network.gethosttype() end

---@return string host_subtype -- eg "onPC"
function gma.network.gethostsubtype() end

---@return string ip
function gma.network.getprimaryip() end

---@return string ip
function gma.network.getsecondaryip() end

---@return string session_status -- eg "Master", "Standalone"
function gma.network.getstatus() end

---@return number session_number
function gma.network.getsessionnumber() end

---@return string session_name
function gma.network.getsessionname() end

---@return number session_slot
function gma.network.getslot() end

---@param ip string
---@param recycle? table
---@return table host_data
function gma.network.gethostdata(ip, recycle) end

---@param slot number
---@param recycle? table
---@return table slot_data
function gma.network.getmanetslot(slot, recycle) end

---@param slot number
---@param recycle? table
---@return table performance_data
function gma.network.getperformance(slot, recycle) end

--#endregion Network
