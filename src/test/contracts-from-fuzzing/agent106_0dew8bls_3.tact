struct DeepNested {
    inner: Inner;
}

struct Inner {
    value: Int;
}

contract MultiLevelNested {
    data: DeepNested;

    init() {
        self.data = DeepNested{inner: Inner{value: 5}};
    }

    receive() {
        self.data = DeepNested{inner: Inner{value: self.data.inner.value + 10}};
    }
}