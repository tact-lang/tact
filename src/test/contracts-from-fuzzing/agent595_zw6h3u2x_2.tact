struct InnerStruct {
    x: Int;
    flag: Bool?;
}

struct MixedStruct {
    intValue: Int;
    boolValue: Bool;
    strValue: String;
    optionalStr: String?;
    nestedStruct: InnerStruct;
}

contract TestMixedPersistence {
    storage: MixedStruct;

    init() {
        self.storage = MixedStruct{
            intValue: 1,
            boolValue: true,
            strValue: "hi",
            optionalStr: null,
            nestedStruct: InnerStruct{
                x: 5,
                flag: null,
            },
        };
    }
}