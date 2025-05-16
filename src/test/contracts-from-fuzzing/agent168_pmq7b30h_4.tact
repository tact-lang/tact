struct Large {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Bool?;
    f5: Int?;
    f6: String?;
    f7: Bool;
    f8: Int;
    f9: String;
    f10: Bool?;
    f11: Int?;
    f12: String?;
}

contract LargeFieldsTest {
    largeField: Large;

    init() {
        self.largeField = Large{
            f1: 1,
            f2: false,
            f3: "a",
            f4: null,
            f5: null,
            f6: null,
            f7: true,
            f8: 8,
            f9: "i",
            f10: null,
            f11: null,
            f12: null,
        };
    }
}
