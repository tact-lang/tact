struct Massive {
    f1: Int;    f2: Bool;    f3: String;    f4: Int?;
    f5: Bool?; f6: String;    f7: Int;
    f8: Bool;  f9: String;    f10: Int as uint32;
    f11: Bool?; f12: String;  f13: Int as int64;
    f14: Int?;   f15: Bool;  f16: String;
    f17: Int;    f18: Bool?; f19: String;
    f20: Int;    f21: Bool;  f22: String;
}

contract HugeStructTest {
    data: Massive;

    init() {
        self.data = Massive{
            f1: 1, f2: true, f3: "a", f4: null,
            f5: null, f6: "b", f7: 7,
            f8: false, f9: "c", f10: 1000,
            f11: null, f12: "d", f13: -5000,
            f14: null, f15: true, f16: "e",
            f17: 17, f18: null, f19: "f",
            f20: 20, f21: false, f22: "g"
        };
    }
}