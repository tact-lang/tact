contract DeepMixedDefaults {
    root: Outer;

    init() {
        self.root = Outer{};
    }
}

struct Outer {
    middle: Middle?;
    value: Int = 1;
}

struct Middle {
    inner: Inner;
    comment: String? = null;
}

struct Inner {
    flag: Bool? = true;
    number: Int = 42;
}
