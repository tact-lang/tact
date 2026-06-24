struct Inner {
    x: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{middle: Middle{inner: Inner{x: 42}}};
    }
}
