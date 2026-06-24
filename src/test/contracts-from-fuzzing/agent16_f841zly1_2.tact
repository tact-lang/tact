struct Inner {
    a: Int;
    b: Bool?;
    c: Address;
    d: Slice?;
}

struct Outer {
    x: Int;
    y: Inner;
    z: Cell?;
}

contract NestedParam(
    data: Outer,
) {
    receive() {}
}