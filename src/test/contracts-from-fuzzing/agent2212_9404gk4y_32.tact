struct Inner {
    x: Int;
    y: Bool;
}

contract Test(
    nested: Inner,
    foo: Int,
    bar: Bool?
) {}
