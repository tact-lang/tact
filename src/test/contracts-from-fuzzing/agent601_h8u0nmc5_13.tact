struct OptionBoolPair {
    first: Bool?;
    second: Bool;
}

struct OptionTestWrap {
    pair: OptionBoolPair;
}

contract OptMixed {
    data: OptionTestWrap;

    init() {
        self.data = OptionTestWrap{
            pair: OptionBoolPair{
                first: null,
                second: true,
            }
        };
    }
}
