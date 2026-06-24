struct ComplexCombo {
    a: Int;
    b: Bool = false;
    c: String?;
    d: Bool?;
    e: String = "x";
}

contract ComplexComboContract {
    data: ComplexCombo;

    init() {
        self.data = ComplexCombo{
            a: 9,
            b: true,
            c: null,
            d: true,
            e: "yy"
        };
    }
}