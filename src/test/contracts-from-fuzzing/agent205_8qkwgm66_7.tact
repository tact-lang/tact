struct TenFields {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: String;
    f5: Bool;
    f6: Bool?;
    f7: String;
    f8: Int?;
    f9: Bool;
    f10: String?;
}

contract StructAsField {
    s: TenFields;

    init() {
        self.s = TenFields{
            f1: 1,
            f2: 2,
            f3: 3,
            f4: "x",
            f5: true,
            f6: null,
            f7: "y",
            f8: null,
            f9: false,
            f10: null
        };
    }
}