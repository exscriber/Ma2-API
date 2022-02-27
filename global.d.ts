declare namespace Lua {
    /** Calls to functions with this type are translated to left % right */
    const Modulo: LuaModulo<number, number, number>

    /** Calls to functions with this type are translated to left // right */
    const FloorDiv: LuaFloorDivision<number, number, number>
}
