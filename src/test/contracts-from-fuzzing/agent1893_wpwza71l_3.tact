struct OptionalStruct {
    optInt: Int?;
    optBool: Bool?;
}

contract OptionalContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{ optInt: null, optBool: null };
    }
}