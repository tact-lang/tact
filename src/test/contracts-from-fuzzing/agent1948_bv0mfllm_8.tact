struct OptionalInStruct {
    inner: Int?;
    flag: Bool;
}

contract OptionalStructField {
    s: OptionalInStruct;
    init() {
        self.s = OptionalInStruct{ inner: null, flag: false };
    }
}