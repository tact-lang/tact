struct OptionStruct {
    foo: Int?;
}

contract ReassignOpt {
    data: OptionStruct;
    init() {
        self.data = OptionStruct{ foo: null };
        self.data = OptionStruct{ foo: 42 };
    }
}