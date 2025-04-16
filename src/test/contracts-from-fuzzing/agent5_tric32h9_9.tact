struct ComboStruct {
    a: Int = 1;
    b: Int?;
    c: String = "x";
    d: String?;
    e: Bool = true;
    f: Bool?;
    g: Address?;
}

contract PartialCombo {
    cstruct: ComboStruct;

    init() {
        self.cstruct = ComboStruct{
            b: 42,
            d: "set",
        };
    }
}