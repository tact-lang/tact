struct BigStruct {
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Int;
    x5: Int;
    x6: Bool;
    x7: Bool;
    x8: String;
    x9: String;
    x10: Bool?;
    x11: Int?;
    x12: String?;
    x13: Bool;
    x14: String;
    x15: Int;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            x1: 1,
            x2: 2,
            x3: 3,
            x4: 4,
            x5: 5,
            x6: true,
            x7: false,
            x8: "a",
            x9: "b",
            x10: null,
            x11: null,
            x12: null,
            x13: true,
            x14: "c",
            x15: 42,
        };
    }
}
