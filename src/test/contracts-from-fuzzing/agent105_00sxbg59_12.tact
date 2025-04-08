struct OptionalInStruct {
    innerOpt: Int?;
}

struct MiddleStruct {
    nestedStruct: OptionalInStruct;
}

contract OptionalDeep {
    storage: MiddleStruct;

    init() {
        self.storage = MiddleStruct{
            nestedStruct: OptionalInStruct{
                innerOpt: null,
            },
        };
    }
}