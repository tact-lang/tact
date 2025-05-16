struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: String;
    f6: Bool?;
    f7: Int;
    f8: String;
    f9: Bool;
    f10: String?;
    f11: Bool;
    f12: Int;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: true,
            f3: "a",
            f4: null,
            f5: "b",
            f6: false,
            f7: 7,
            f8: "c",
            f9: true,
            f10: null,
            f11: false,
            f12: 12,
        };
    }
}
