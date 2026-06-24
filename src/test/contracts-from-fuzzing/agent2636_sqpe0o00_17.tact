contract NestedOptionalStructs {
    s: Outer?;

    init() {
        self.s = Outer{
            inner: Inner{ val: 123 }
        };
    }
}

struct Outer {
    inner: Inner;
}

struct Inner {
    val: Int;
}