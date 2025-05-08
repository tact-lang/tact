struct Combo {
    intField: Int;
    boolField: Bool;
    strField: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract ComboExample {
    data: Combo;

    init() {
        self.data = Combo{
            intField: 100,
            boolField: true,
            strField: "hello",
            optInt: null,
            optBool: null,
            optStr: null
        };
    }
}