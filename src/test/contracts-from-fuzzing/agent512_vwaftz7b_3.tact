struct ManyFields {
    f1: Int;
    f2: Int?;
    f3: Bool;
    f4: Bool?;
    f5: Int;
    f6: String;
    f7: Int?;
    f8: Bool;
    f9: String;
    f10: Bool?;
}

contract ManyStorage {
    record: ManyFields;

    init() {
        self.record = ManyFields{
            f1: 1,
            f2: null,
            f3: true,
            f4: false,
            f5: 5,
            f6: "Hello",
            f7: 7,
            f8: false,
            f9: "World",
            f10: null,
        };
    }

    receive() {}
}