struct Inner {
    val: Int = 42;
}

struct Outer {
    nested: Inner;
}

contract Good {
    data: Outer = Outer{ nested: Inner{} };
}