struct DeepNested {
    field1: Int;
    field2: Nested;
}

struct Nested {
    inner1: Bool;
    inner2: InnerMost;
}

struct InnerMost {
    flag: Bool;
    value: Int;
}

contract StorageTest {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            field1: 42,
            field2: Nested{
                inner1: true,
                inner2: InnerMost{
                    flag: false,
                    value: 99,
                }
            }
        };
    }
}
