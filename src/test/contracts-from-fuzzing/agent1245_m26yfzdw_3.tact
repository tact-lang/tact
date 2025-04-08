struct LongFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Bool?;
    f5: Int?;
    f6: String?;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int;
}

contract LongFieldsContract {
    lf: LongFields;

    init() {
        self.lf = LongFields{
            f1: 1,
            f2: false,
            f3: "a",
            f4: null,
            f5: null,
            f6: "b",
            f7: 2,
            f8: true,
            f9: "c",
            f10: 3,
        };
    }
}
