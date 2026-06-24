struct DeepNested {
    field: Nested;
}

struct Nested {
    inner: Inner;
}

struct Inner {
    value: Int;
}

contract StorageTest {
    state: DeepNested;

    init() {
        self.state = DeepNested{
            field: Nested{
                inner: Inner{
                    value: 42,
                },
            },
        };
    }
}