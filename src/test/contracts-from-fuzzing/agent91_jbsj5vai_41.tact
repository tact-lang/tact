struct OptionInStruct {
    maybe: Int?;
    definitely: Int;
}

contract OptionPersist {
    data: OptionInStruct;

    init() {
        self.data = OptionInStruct{
            maybe: null,
            definitely: 123
        };
    }
}
