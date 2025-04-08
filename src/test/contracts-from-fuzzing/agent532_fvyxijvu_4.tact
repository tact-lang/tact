struct ManyFields {
    f1: Int;
    f2: String;
    f3: Bool;
    f4: Int?;
    f5: Bool?;
    f6: String;
    f7: Bool;
    f8: Int;
    f9: String;
    f10: Bool?;
}

contract ManyFieldsPersistent {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: "a",
            f3: true,
            f4: null,
            f5: false,
            f6: "b",
            f7: true,
            f8: 8,
            f9: "c",
            f10: null
        };
    }
}