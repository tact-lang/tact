struct DeepNested {
    inner: Nested;
}

struct Nested {
    innerMost: InnerMost?; // optional nested struct
}

struct InnerMost {
    value: Int;
}

contract StorageTest {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: Nested{
                innerMost: InnerMost{
                    value: 123
                }
            }
        };
    }
}