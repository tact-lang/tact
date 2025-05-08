struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inr: Inner?;
}

contract Test(
    nested: Outer
) {}
