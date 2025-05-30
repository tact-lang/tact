struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract NestedStructInState {
    s: Outer;

    init() {
        self.s = Outer{ nested: Inner{ a: 5, b: false }, flag: true };
    }
}
