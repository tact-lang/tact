contract NestedOptOutside {
    s: Outer?;

    init() {
        self.s = null;
    }
}

struct Outer {
    a: Int;
    b: Inner;
}

struct Inner {
    x: Int?;
}