struct DeepNested {
    inner: Inner;
}

struct Inner {
    x: Int;
    flag: Bool;
}

contract UseDeepNested {
    field: DeepNested;

    init() {
        self.field = DeepNested{ inner: Inner{ x: 5, flag: false } };
    }
}
