struct DeepNested {
    inner: NestedOption;
}

struct NestedOption {
    field1: Int;
    optField: Int?;
}

contract Test {
    data: DeepNested;
    init() {
        self.data = DeepNested{
            inner: NestedOption{
                field1: 10,
                optField: null,
            }
        };
    }
}