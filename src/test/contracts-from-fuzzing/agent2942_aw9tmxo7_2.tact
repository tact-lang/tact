struct InnerNested {
    field1: Int;
    field2: Bool?;
}

struct OuterNested {
    nested: InnerNested;
    optionalInt: Int?;
}

contract StorageTest {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            nested: InnerNested{
                field1: 42,
                field2: null,
            },
            optionalInt: null,
        };
    }
}