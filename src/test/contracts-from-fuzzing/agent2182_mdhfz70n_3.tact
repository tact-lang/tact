struct ManyFields {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: String;
    f5: Bool;
    f6: String;
    f7: Int;
    f8: Int;
    f9: Bool;
    f10: String;
}

contract BigFieldsContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: 2,
            f3: true,
            f4: "a",
            f5: false,
            f6: "b",
            f7: 7,
            f8: 8,
            f9: true,
            f10: "c"
        };
    }
}