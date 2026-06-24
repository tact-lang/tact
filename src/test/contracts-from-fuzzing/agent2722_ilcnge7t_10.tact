struct SOpt {
    inner: Int?;
    flag: Bool;
}

contract OptionalInStruct {
    sopt: SOpt;

    init() {
        self.sopt = SOpt {
            inner: null,
            flag: false,
        };
    }
}