struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int;
    f5: Bool;
    f6: String;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int;
    f11: Bool;
    f12: String;
}

contract StorageTest {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: false,
            f3: "A",
            f4: 2,
            f5: true,
            f6: "B",
            f7: 3,
            f8: false,
            f9: "C",
            f10: 4,
            f11: true,
            f12: "D",
        };
    }
}