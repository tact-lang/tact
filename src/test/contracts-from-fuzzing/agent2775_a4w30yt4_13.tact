struct DefaultOpt {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
    d: Bool?;
}

contract DefaultsOptionalCombo {
    s: DefaultOpt;

    init() {
        self.s = DefaultOpt{
            a: 42,
            b: null,
            c: true,
            d: null
        };
    }
}
