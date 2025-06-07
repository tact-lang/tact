struct ManyFields {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Bool?;
    f5: String;
    f6: String?;
    f7: Int;
    f8: Int?;
    f9: Bool;
    f10: Bool?;
    f11: String;
    f12: String?;
}

contract NumerousFields {
    store: ManyFields;

    init() {
        self.store = ManyFields{
            f1: 1, f2: 2, f3: true, f4: null, f5: "a", f6: null,
            f7: 7, f8: null, f9: false, f10: null, f11: "k", f12: null
        };
    }
}