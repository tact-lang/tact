struct OptionalCombo {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract OptionalStructField {
    opt: OptionalCombo;

    init() {
        self.opt = OptionalCombo{
            a: null,
            b: true,
            c: null,
            d: "optional",
        };
    }
}