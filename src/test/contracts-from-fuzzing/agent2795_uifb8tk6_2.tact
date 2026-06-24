struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Int?;
}

contract NestedStorage {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            inner: InnerStruct{
                x: 1,
                y: null,
            }
        };
    }
}