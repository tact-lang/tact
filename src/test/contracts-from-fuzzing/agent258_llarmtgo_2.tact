struct DeeplyNestedStruct {
    inner: InnerStruct;
    optionalInner: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
    nested: InnerMostStruct;
}

struct InnerMostStruct {
    num: Int;
    text: String;
    optBool: Bool?;
}

contract TestContract {
    storage: DeeplyNestedStruct;

    init() {
        self.storage = DeeplyNestedStruct{
            inner: InnerStruct{
                flag: true,
                nested: InnerMostStruct{
                    num: 123,
                    text: "abc",
                    optBool: false,
                },
            },
            optionalInner: null,
        };
    }
}