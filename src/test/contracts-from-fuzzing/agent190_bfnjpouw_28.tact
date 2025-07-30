struct Inner {
    x: Int?;
    y: Bool?;
}

struct Outer {
    inside: Inner?;
}

contract NestedOptParam(
    data: Outer?,
) {}