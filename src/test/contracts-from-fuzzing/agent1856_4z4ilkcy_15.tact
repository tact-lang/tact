struct Param1 { a: Int }
struct Param2 { p1: Param1 }
struct Param3 { p2: Param2 }
struct Param4 { p3: Param3 }

contract ParamDeep(
    data: Param4,
) {
    // no manual init, direct param init
}
