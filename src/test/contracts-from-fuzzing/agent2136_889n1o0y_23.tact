struct Inner {
    small: Int as uint32;
}

struct Outer {
    nested: Inner;
}

contract TestContract {
    v: Outer = Outer{ nested: Inner{ small: 123 } };

    init() {}
}