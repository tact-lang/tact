struct DeepNested {
    inner: Inner;
}

struct Inner {
    flag: Bool;
    count: Int;
}

contract DeepNestedContract {
    s: DeepNested = DeepNested{ inner: Inner{ flag: true, count: 9 }};

    init() {
        self.s = DeepNested{ inner: Inner{ flag: false, count: 100 }};
    }
}