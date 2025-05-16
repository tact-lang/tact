struct OptionInStruct {
    foo: Int?;
    bar: Bool?;
}

contract OptionalsInStruct {
    val: OptionInStruct;
    val2: OptionInStruct;

    init() {
        self.val = OptionInStruct{ foo:null, bar:null };
        self.val2 = OptionInStruct{ foo:null, bar:null };
    }
}