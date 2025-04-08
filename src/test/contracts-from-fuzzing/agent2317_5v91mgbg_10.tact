struct OptionalStruct {
    flag: Bool?;
    description: String?;
}

contract OptionalInStruct {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{ flag: null, description: null };
    }
}