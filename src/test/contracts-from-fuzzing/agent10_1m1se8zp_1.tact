struct DeepNested {
    val1: Int;
    optInner: InnerStruct?;
}

struct InnerStruct {
    nested: NestedStruct;
}

struct NestedStruct {
    a: Int;
    b: Bool;
}

contract TestDeep {
    data: DeepNested;
    init() {
        self.data = DeepNested{
            val1: 1,
            optInner: InnerStruct{
                nested: NestedStruct{
                    a: 2,
                    b: true,
                },
            },
        };
    }
}
