struct Holder {
    f0: Int;
    f1: Int;
    f2: Bool;
    f3: Bool;
    f4: String;
    f5: String;
    f6: Int?;
    f7: Bool?;
    f8: String?;
    f9: Int;
    f10: Bool;
}

contract StructFieldTest {
    stuff: Holder;
    init() {
        self.stuff = Holder{
            f0: 1,
            f1: 2,
            f2: true,
            f3: false,
            f4: "a",
            f5: "b",
            f6: null,
            f7: null,
            f8: null,
            f9: 9,
            f10: true
        };
    }
}