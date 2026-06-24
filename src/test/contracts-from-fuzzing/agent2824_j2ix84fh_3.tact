struct ManyFields {
    f0: Int;
    f1: Bool;
    f2: String;
    f3: Int?;
    f4: String?;
    f5: Bool?;
    f6: Int;
    f7: Bool;
    f8: String;
    f9: Int?;
}

contract ManyFieldsContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f0: 1,
            f1: true,
            f2: "test",
            f3: null,
            f4: null,
            f5: null,
            f6: 7,
            f7: false,
            f8: "abc",
            f9: null
        };
    }
}