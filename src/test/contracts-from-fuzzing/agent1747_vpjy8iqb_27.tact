struct OptionInStruct {
    maybeStr: String?;
}

contract DefaultNullStruct {
    s: OptionInStruct = OptionInStruct{ maybeStr: null };
    
    init() {
        self.s = OptionInStruct{ maybeStr: "xyz" };
    }
}