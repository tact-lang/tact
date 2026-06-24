struct ManyFields {
    f1: Int;
    f2: Int?;
    f3: String;
    f4: Bool;
    f5: String?;
    f6: Int as uint8;
    f7: Bool?;
    f8: String;
    f9: Int?;
    f10: Bool;
    f11: String?;
    f12: Int;
}

contract BigStructContract {
    big: ManyFields;

    init() {
        self.big = ManyFields{
            f1: 1,
            f2: null,
            f3: "3",
            f4: false,
            f5: null,
            f6: 255,
            f7: true,
            f8: "8",
            f9: 9,
            f10: true,
            f11: null,
            f12: 12,
        };
    }
}