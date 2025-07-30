struct OptionalInStruct {
    optInt: Int?;
    optStr: String?;
}

contract OptionalStructHolder {
    holder: OptionalInStruct;

    init() {
        self.holder = OptionalInStruct{ optInt: null, optStr: null };
    }
}