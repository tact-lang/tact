// contract parameters with nested and optional structs
struct SLevel2 {
    z: Bool?;
}

struct SLevel1 {
    y: Int;
    nested: SLevel2?;
}

contract ParamsNestedOpt(
    p1: Int,
    p2: Bool,
    p3: SLevel1?
) {}