struct DeepNested {
    inner: Inner;
}

struct Inner {
    deeper: Deeper;
}

struct Deeper {
    value: Int;
}

contract NestedStructContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{ inner: Inner{ deeper: Deeper{ value: 10 } } };
    }
}