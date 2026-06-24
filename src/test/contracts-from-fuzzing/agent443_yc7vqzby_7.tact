struct ManyFields {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Bool;
    f5: String;
    f6: Bool;
    f7: String;
    f8: Int;
    f9: Bool;
    f10: Int;
}

contract ManyFieldsContract {
    state: ManyFields;

    init() {
        self.state = ManyFields{
            f1: 1,
            f2: 2,
            f3: 3,
            f4: true,
            f5: "abc",
            f6: false,
            f7: "def",
            f8: 8,
            f9: true,
            f10: 10
        };
    }
}