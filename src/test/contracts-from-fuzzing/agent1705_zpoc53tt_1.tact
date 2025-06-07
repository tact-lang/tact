struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: LeafOption;
}

struct LeafOption {
    val: Int?;
}

contract TestContract {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            inner: InnerStruct{
                x: 1,
                y: LeafOption{ val: null },
            },
        };
    }
}
