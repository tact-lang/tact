struct OptionBoolCombo {
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
    b4: Bool?;
    b5: Bool?;
}

contract TestOptionBoolCombo {
    d: OptionBoolCombo;

    init() {
        self.d = OptionBoolCombo{
            b1:null,b2:null,b3:null,b4:null,b5:null
        };
    }
}