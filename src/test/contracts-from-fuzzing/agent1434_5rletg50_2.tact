struct DeepNested {
    inner: Inner;
}

struct Inner {
    value: Int;
}

contract NestedStructTest {
    data: DeepNested;
    init() {
        self.data = DeepNested{ inner: Inner{ value: 1 } };
    }
}