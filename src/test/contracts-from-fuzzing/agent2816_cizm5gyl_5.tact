struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Int;
    f4: Bool;
    f5: String;
    f6: Int;
    f7: Bool;
    f8: Int;
    f9: Bool;
    f10: Int;
}

contract LargeStructStorage {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: true,
            f3: 3,
            f4: false,
            f5: "hi",
            f6: 6,
            f7: true,
            f8: 8,
            f9: false,
            f10: 10,
        };
    }
}