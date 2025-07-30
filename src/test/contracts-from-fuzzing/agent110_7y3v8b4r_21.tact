struct MultiOption {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptionCombo {
    comp: MultiOption;

    init() {
        self.comp = MultiOption{
            a: null,
            b: null,
            c: null,
            d: null
        };
    }
}