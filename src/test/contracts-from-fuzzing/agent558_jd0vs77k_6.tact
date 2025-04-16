struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Int?;
    f11: Bool?;
    f12: String;
    f13: Int;
    f14: Bool;
    f15: String;
}

contract TestBigStruct {
    store: BigStruct;

    init() {
        self.store = BigStruct{
            f1: 1, f2: true, f3: "A",
            f4: null, f5: false, f6: "B",
            f7: 7, f8: false, f9: "C",
            f10: 42, f11: null, f12: "D",
            f13: 13, f14: true, f15: "E",
        };
    }
}