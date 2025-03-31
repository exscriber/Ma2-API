// Typescript typedef for GrandMA2 Lua API

// This code is freely distributable under the terms of the [MIT license]
// Copyright (c) 2022 Nick N. Zinovenko

/** GrandMA2 Lua API
 * @noSelf */
declare namespace gma {
    type handle = number
    type error = string
    type success = boolean

    /** Front panel interaction */
    namespace canbus {
        function hardkey(keycode: number, pressed: boolean, hold: boolean): success
        function encoder(encoder: number, steps: number, pressed: boolean): success
        function wheel(steps: number): success
        function ball(x_axis: number, y_axis: number): success
    }

    /** Sleep for n seconds */
    function sleep(seconds: number): void

    /** Print to System Monitor console */
    function echo(...args: any[]): void

    /** Print to Command Line feedback */
    function feedback(...args: any[]): void

    /** Execute GrandMA2 CLI command */
    function cmd(command: string): error

    /** Get Build date eg "Jan 01 2021" */
    function build_date(): string

    /** Get Build date eg "22:22:22" */
    function build_time(): string

    /** Git Version hash */
    function git_version(): string

    /** Get Hardware type: "GMA2" or "GMA3" */
    function gethardwaretype(): string

    /** Import Xml file to Lua table
     * @customName import */
    function import_xml(filename: string, subfolder?: string): LuaTable

    /** Export Lua table to Xml file
     * @customName export */
    function export_xml(filename: string, data: LuaTable): void

    /** Export Lua table to Csv file */
    function export_csv(filename: string, data: LuaTable): void

    /** Export Lua table to Json file */
    function export_json(filename: string, data: LuaTable): void

    /** Set timer function */
    function timer(callback: CallableFunction, timeout: number, max_count: number, cleanup?: CallableFunction): void

    /** Get unix timestamp time */
    function gettime(): number

    /** Show input dialog */
    function textinput(title: string, placeholder?: string): string

    namespace gui {
        /** Show confirm dialog */
        function confirm(title: string, message: string): boolean

        /** Show messagebox dialog */
        function msgbox(title: string, message: string): boolean
    }

    namespace gui.progress {
        /** Show Progressbar-- must be stopped by Lua code somewhere */
        function start(name: string): handle

        /** Stop Progressbar */
        function stop(handle: handle): void

        /** Set Progressbar text */
        function settext(handle: handle, text: string): void

        /** Set Progressbar range */
        function setrange(handle: handle, from: number, to: number): void

        /** Set Progressbar value */
        function set(handle: handle, value: number): void
    }

    namespace user {
        function getcmddest(): handle
        function getselectedexec(): handle

        function getvar(uservar_name: string): string
        function setvar(uservar_name: string, value: string): void
    }

    namespace show {
        function getdmx(dmx_addr: number): number
        function getdmx(recycle: LuaTable, dmx_addr: number, amount: number): LuaTable

        function getvar(var_name: string): string
        function setvar(var_name: string, value: string): void

        /** @noSelf */
        interface getobj {
            /** Get object handle from name eq 'Fixture 123.1' */
            handle(name: string): handle
            handle(handle: handle): handle

            /** Get object class name */
            class(handle: handle): string

            /** Get object index */
            index(handle: handle): number

            /** Get object CLI number (id) */
            number(handle: handle): number

            /** Get object name */
            name(handle: handle): string

            /** returns nil if object has no label set */
            label(handle: handle):string | null

            /** return number of children objects */
            amount(handle: handle): number

            /** Get child of object by index */
            child(handle: handle, index: number): handle

            /** Get parent of object */
            parent(handle: handle): handle

            /** Verify object exists */
            verify(handle: handle): boolean

            /** Compare to objects by handle */
            compare(handle1: handle, handle2: handle): boolean
        }
        const getobj: gma.show.getobj
    }

    namespace show.property {
        /** Get number of object properties */
        function amount(handle: handle): number

        /** Get property name by index */
        function name(handle: handle, index: number): string

        /** Get property value by name or index */
        function get(handle: handle, index: number): string
        function get(handle: handle, name: string): string

        /** Set property value by name or index */
        function set(handle: handle, index: number, value: string): success
        function set(handle: handle, name: string, value: string): success
    }

    namespace network {
        /** Get host type - eg "Console" */
        function gethosttype(): string

        /** Get host subtype - eg "onPC" */
        function gethostsubtype(): string

        /** Get primary IP address */
        function getprimaryip(): string

        /** Get secondary IP address */
        function getsecondaryip(): string

        /** Get session status - eg "Master" or "Standalone" */
        function getstatus(): string

        /** Get session number */
        function getsessionnumber(): number

        /** Get session name */
        function getsessionname(): string

        /** Get session slot number */
        function getslot(): number

        /** Get diagnostic host data */
        function gethostdata(ip: string, recycle?: LuaTable): LuaTable

        /** Get diagnostic manet slot data */
        function getmanetslot(slot: number, recycle?: LuaTable): LuaTable

        /** Get diagnostic performance data */
        function getperformance(slot: number, recycle?: LuaTable): LuaTable
    }
}
