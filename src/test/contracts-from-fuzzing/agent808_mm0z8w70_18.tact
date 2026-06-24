struct OptionStruct {
    x: Int?;
}

contract OptionalStructDefault {
    s: OptionStruct = OptionStruct{ x: null };

    init() {
        self.s = OptionStruct{ x: 42 };
    }
}