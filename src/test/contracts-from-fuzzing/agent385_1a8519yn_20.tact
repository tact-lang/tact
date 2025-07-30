struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int as uint8;
    f5: String;
    f6: Bool;
    f7: Int as uint32;
    f8: String;
    f9: Bool;
    f10: Int;
    f11: String;
    f12: Bool;
    f13: Int as uint16;
    f14: String;
    f15: Bool;
    f16: Int as uint256;
    f17: String;
    f18: Bool;
    f19: String;
    f20: Int as coins;
    f21: Bool;
}

contract BigStateTest {
    huge: BigStruct;

    init() {
        self.huge = BigStruct{
            f1: 1, f2: true, f3: "a", f4: 4, f5: "b", f6: false,
            f7: 7, f8: "c", f9: true, f10: 10, f11: "d", f12: false,
            f13: 13, f14: "e", f15: true, f16: 123456, f17: "f",
            f18: false, f19: "g", f20: ton("1"), f21: true
        };
    }
}
