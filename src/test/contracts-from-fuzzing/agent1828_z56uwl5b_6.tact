struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int as uint8;
    f5: String;
    f6: Int as int16;
    f7: Bool;
    f8: String;
    f9: Int;
    f10: Int as uint4;
    f11: String;
    f12: Bool;
    f13: Int as uint32;
    f14: String;
    f15: Bool;
}

contract TestContract {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            f1: 1,
            f2: true,
            f3: "a",
            f4: 4,
            f5: "b",
            f6: -6,
            f7: false,
            f8: "c",
            f9: 9,
            f10: 10,
            f11: "d",
            f12: true,
            f13: 13,
            f14: "e",
            f15: false
        };
    }
}