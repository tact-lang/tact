struct Inner {
    x: Int;
}

struct Outer {
    nested: Inner?;
}

contract Test {
    data: Outer = Outer{ nested: null };
}