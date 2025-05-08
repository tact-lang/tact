struct Inner {
    flag: Bool?;
    num: Int?;
}

contract OptionalStruct {
    optField: Inner?;

    init() {
        self.optField = Inner{ flag: true, num: 123 };
    }
}