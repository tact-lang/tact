struct OptionalInnerStruct {
    inner: Int?;
    flag: Bool;
}

contract OptionalsCombination {
    data: OptionalInnerStruct;

    init() {
        self.data = OptionalInnerStruct{ inner: null, flag: false };
    }
}