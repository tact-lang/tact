struct Inner {
    flag: Bool;
    str: String;
}

struct Outer {
    value: Int;
    nested: Inner?;
}

contract ComplexOptionals {
    inner: Inner?;
    outer: Outer;

    init() {
        self.inner = null;
        self.outer = Outer{ value: 10, nested: null };
    }
}