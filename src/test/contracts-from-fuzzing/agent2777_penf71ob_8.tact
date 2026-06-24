struct HugeStruct {
    f01: Int;
    f02: Bool;
    f03: String;
    f04: Int?;
    f05: Bool?;
    f06: String?;
    f07: Int;
    f08: Bool;
    f09: String;
    f10: Int?;
    f11: Bool?;
    f12: String?;
    f13: Int;
    f14: Bool;
    f15: String;
    f16: Int?;
    f17: Bool?;
    f18: String?;
    f19: Int;
    f20: Bool;
}

contract TestContract {
    bigData: HugeStruct;

    init() {
        self.bigData = HugeStruct{
            f01: 1, f02: true, f03: "a",
            f04: null, f05: false, f06: "b",
            f07: 2, f08: false, f09: "c",
            f10: null, f11: true, f12: "d",
            f13: 3, f14: true, f15: "e",
            f16: null, f17: false, f18: "f",
            f19: 4, f20: true
        };
    }
}