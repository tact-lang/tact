struct Rec1 { v: Int; }
struct Rec2 { v: Rec1; }
struct Rec3 { v: Rec2; }

contract OptNestedParam(
    p: Rec3?
) {}