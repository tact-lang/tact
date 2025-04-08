struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Bool?;
    f5: Int?;
    f6: String;
    f7: Bool;
    f8: Int;
    f9: String?;
    f10: Bool;
}

contract LargeStructStorage {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: true,
            f3: "abc",
            f4: null,
            f5: null,
            f6: "def",
            f7: false,
            f8: 123,
            f9: null,
            f10: true
        };
    }
}
