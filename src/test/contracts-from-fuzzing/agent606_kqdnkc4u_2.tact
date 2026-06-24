struct Inner {
    val: Int = 42;
}

struct Outer {
    nested: Inner?;
}

contract Test {
    data: Outer = Outer{ nested: null };
}