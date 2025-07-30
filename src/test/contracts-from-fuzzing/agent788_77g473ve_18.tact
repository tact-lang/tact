struct OptionInStruct {
    a: Int?;
    b: Bool?;
}

contract UninitStructOpt {
    s: OptionInStruct;

    init() {
        self.s = OptionInStruct{ a: null, b: null };
    }
}
