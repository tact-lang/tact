struct InnerMost {
    value: Int;
}

struct Inner {
    deeper: InnerMost;
}

struct DeepNested {
    inner: Inner;
}

contract Test {
    data: DeepNested;

    init() {
        self.data = DeepNested{ inner: Inner{ deeper: InnerMost{ value: 42 } } };
    }

    receive() {
        self.data = DeepNested{ inner: Inner{ deeper: InnerMost{ value: 7 } } };
    }
}