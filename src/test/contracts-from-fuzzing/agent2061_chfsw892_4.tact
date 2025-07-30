struct LargeFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String;
    f7: Int;
    f8: String;
    f9: Bool;
    f10: Int;
}

contract LongFieldsContract {
    data: LargeFields;

    init() {
        self.data = LargeFields{
            f1: 1,
            f2: false,
            f3: "A",
            f4: null,
            f5: true,
            f6: "B",
            f7: 7,
            f8: "C",
            f9: false,
            f10: 10,
        };
    }
}