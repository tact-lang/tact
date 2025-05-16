struct OptionBoolCombo {
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
}

contract AllOptBools {
    f: OptionBoolCombo;
    init() {
        self.f = OptionBoolCombo{b1:null,b2:true,b3:null};
    }
}