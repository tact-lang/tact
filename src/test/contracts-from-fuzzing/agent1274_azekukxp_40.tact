struct TwoBoolOpt {
    a: Bool?;
    b: Bool?;
}

contract OptBoolStruct {
    s: TwoBoolOpt;

    init() {
        self.s = TwoBoolOpt {
            a: null,
            b: null
        };
    }
}