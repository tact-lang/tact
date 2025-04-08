struct OptionNest {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionCombo {
    opt: OptionNest;

    init() {
        self.opt = OptionNest{
            a: null,
            b: null,
            c: null,
        };
    }
}