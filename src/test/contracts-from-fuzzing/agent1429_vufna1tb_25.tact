struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
}

contract DeepDefaults {
    data: Outer = Outer{ inner: Inner{ a: 5 } };

    init() {
        self.data = Outer{ inner: Inner{ a: 99 } };
    }
}
