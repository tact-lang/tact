struct Combo {
    a: Int;
    b: Bool?;
    c: InnerStruct;
    d: String?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract MixedFields {
    comboField: Combo;
    optCombo: Combo?;

    init() {
        self.comboField = Combo{
            a: 1,
            b: null,
            c: InnerStruct{x: 2, y: true},
            d: null
        };
        self.optCombo = null;
    }
}