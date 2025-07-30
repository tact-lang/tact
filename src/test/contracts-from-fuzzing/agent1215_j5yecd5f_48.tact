struct Basic {
    i: Int;
}

struct NestedArray {
    a1: Basic;
    a2: Basic;
    a3: Basic;
    a4: Basic;
    a5: Basic;
}

contract BigNestedParams(
    p1: NestedArray,
    p2: NestedArray?,
    p3: NestedArray,
    p4: NestedArray?,
) {}