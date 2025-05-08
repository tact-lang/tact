struct OptionalStruct {
    optField: Int?;
}

contract OptionalNestedStruct {
    param: OptionalStruct;

    init() {
        self.param = OptionalStruct{ optField: null };
    }
}
