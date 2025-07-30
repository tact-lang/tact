struct DeepNested {
    field1: Int;
    field2: InnerStruct;
    field3: Bool;
}

struct InnerStruct {
    inner1: Bool;
    inner2: DeepInnerStruct;
}

struct DeepInnerStruct {
    nested1: Int;
    nested2: Bool;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            field1: 1,
            field2: InnerStruct{
                inner1: false,
                inner2: DeepInnerStruct{
                    nested1: -5,
                    nested2: true,
                },
            },
            field3: true,
        };
    }
}