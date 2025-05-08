struct OptionInStruct {
    x: Int?;
    y: Bool?;
}

contract OptionStruct {
    nested: OptionInStruct;

    init() {
        self.nested = OptionInStruct{ x: null, y: null };
    }
}