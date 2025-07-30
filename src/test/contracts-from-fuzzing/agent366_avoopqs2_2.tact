struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String;
    f7: Bool;
    f8: String?;
    f9: Int;
    f10: Bool;
}

contract LotsFields {
    storage: ManyFields;
    init() {
        self.storage = ManyFields{
            f1: 1,
            f2: true,
            f3: "x",
            f4: null,
            f5: false,
            f6: "y",
            f7: true,
            f8: null,
            f9: 42,
            f10: false,
        };
    }
}