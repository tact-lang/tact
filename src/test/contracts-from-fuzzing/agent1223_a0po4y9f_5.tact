struct ManyFields {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Bool;
    f5: String;
    f6: String;
    f7: Int?;
    f8: Bool?;
    f9: String?;
    f10: Int;
}

contract ManyFieldsContract {
    s: ManyFields;
    init() {
        self.s = ManyFields{
            f1: 1,
            f2: 2,
            f3: true,
            f4: false,
            f5: "hello",
            f6: "world",
            f7: null,
            f8: null,
            f9: null,
            f10: 10
        };
    }
}