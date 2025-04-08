struct S1 { x: Int; }
struct S2 { y: S1; }

contract ParamDeep(
    param: S2,
) {}