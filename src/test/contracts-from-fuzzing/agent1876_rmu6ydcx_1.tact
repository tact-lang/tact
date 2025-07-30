struct OptionalStruct {
    optVal: Int?;
    optBool: Bool?;
}

contract OptContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{ optVal: null, optBool: null };
    }
}