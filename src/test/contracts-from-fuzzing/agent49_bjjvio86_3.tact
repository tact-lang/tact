struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int;
}

contract WithDeepNesting {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: InnerStruct{ value: 999 },
        };
    }
}
