contract NestedOptDefaults {
    x: Outer;

    init() {
        self.x = Outer{};
    }
}

struct Outer {
    inner: Inner? = null;
}

struct Inner {
    y: Int = 123;
}
