struct DeepNested {
    inner: Inner;
    z: Int;
}

struct Inner {
    a: Int;
    b: Int;
}

contract TestNested {
    d: DeepNested;

    init() {
        self.d = DeepNested{ inner: Inner{ a: 10, b: 20 }, z: 30 };
    }
}