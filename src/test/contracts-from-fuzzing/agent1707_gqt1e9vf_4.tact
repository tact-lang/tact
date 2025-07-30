struct OptionalStruct {
    optInt: Int?;
    optBool: Bool?;
}

contract OptionalFields {
    st: OptionalStruct;

    init() {
        self.st = OptionalStruct{ optInt: null, optBool: true };
    }
}