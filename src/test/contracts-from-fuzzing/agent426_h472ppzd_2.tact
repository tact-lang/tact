struct InnerNested {
    a: Int;
    b: Bool?;
}

struct OuterNested {
    x: Int;
    y: InnerNested;
    z: Bool;
}

contract DeepNestedParams(
    param1: Int,
    param2: OuterNested,
) {}