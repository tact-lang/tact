struct BigStruct {
    f01: Int;
    f02: Int?;
    f03: String;
    f04: String?;
    f05: Bool;
    f06: Bool?;
    f07: Int;
    f08: Int?;
    f09: String;
    f10: String?;
    f11: Bool;
    f12: Bool?;
    f13: Int;
    f14: Int?;
    f15: String;
    f16: String?;
    f17: Bool;
    f18: Bool?;
    f19: Int;
    f20: Int?;
    f21: String;
    f22: String?;
    f23: Bool;
    f24: Bool?;
    f25: Int;
    f26: Int?;
    f27: String;
    f28: String?;
    f29: Bool;
    f30: Bool?;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            f01: 1,   f02: null,
            f03: "3",   f04: null,
            f05: true, f06: null,
            f07: 7,   f08: null,
            f09: "9",   f10: null,
            f11: true, f12: null,
            f13: 13,  f14: null,
            f15: "15", f16: null,
            f17: true, f18: null,
            f19: 19,  f20: null,
            f21: "21", f22: null,
            f23: true, f24: null,
            f25: 25,  f26: null,
            f27: "27", f28: null,
            f29: true, f30: null
        };
    }
}