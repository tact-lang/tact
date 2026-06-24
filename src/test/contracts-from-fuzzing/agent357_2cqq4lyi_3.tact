struct DeeplyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    leaf: LeafStruct;
}

struct LeafStruct {
    val: Int;
}

contract DeepNest {
    store: DeeplyNested;

    init() {
        self.store = DeeplyNested{
            inner: InnerStruct{
                leaf: LeafStruct{
                    val: 999,
                },
            },
        };
    }
}