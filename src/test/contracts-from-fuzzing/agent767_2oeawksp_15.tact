struct ComplexCombo {
    a: Int;
    b: Bool?;
    c: String; 
    d: InnerCombo;
}

struct InnerCombo {
    a2: Int?;
    b2: Bool;
    c2: String?;
}

contract ComboTests {
    data: ComplexCombo;

    init() {
        self.data = ComplexCombo{
            a: 11,
            b: null,
            c: "hi",
            d: InnerCombo{
                a2: null,
                b2: true,
                c2: null
            }
        };
    }
}