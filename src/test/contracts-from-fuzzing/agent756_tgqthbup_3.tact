struct DeepNest {
    field1: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    nested: InnerMost;
}

struct InnerMost {
    flag: Bool;
    data: String?;
}

contract TestDeep {
    deep: DeepNest;

    init() {
        self.deep = DeepNest{
            field1: 5,
            inner: InnerStruct{
                nested: InnerMost{
                    flag: true,
                    data: "abc",
                },
            },
        };
    }
}