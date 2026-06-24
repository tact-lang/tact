struct OptionalsInStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
}

contract OptStructField {
    info: OptionalsInStruct;

    init() {
        self.info = OptionalsInStruct {
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}
