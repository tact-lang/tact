contract NestedStructAssignment {
    a: Outer;

    init() {
        self.a = Outer{ inner: Inner{ val: 42 } };
    }
}

struct Outer {
    inner: Inner;
}

struct Inner {
    val: Int;
}