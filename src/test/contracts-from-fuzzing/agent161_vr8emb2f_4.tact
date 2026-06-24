struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int;
    f5: Bool;
    f6: String;
    f7: Bool?;
    f8: String?;
    f9: Int?;
    f10: Int;
}

contract TestManyFields {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: true,
            f3: "a",
            f4: 4,
            f5: false,
            f6: "b",
            f7: null,
            f8: null,
            f9: null,
            f10: 10,
        };
    }
}
