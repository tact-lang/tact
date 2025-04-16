struct InnerOption {
    value: Int?;
    flag: Bool?;
}

contract OptionInStruct {
    o: InnerOption;

    init() {
        self.o = InnerOption{ value: null, flag: true };
    }
}