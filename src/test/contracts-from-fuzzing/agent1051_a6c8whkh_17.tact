struct LargeStruct {
    f01: Int;
    f02: Bool;
    f03: String;
    f04: Int?;
    f05: Bool?;
    f06: String;
    f07: Int;
    f08: Bool;
    f09: String;
    f10: Int?;
    f11: Bool?;
    f12: String;
    f13: Int;
    f14: Bool;
    f15: String;
    f16: Int?;
}

contract TestContract {
    big: LargeStruct;
    init() {
        self.big = LargeStruct{
            f01: 1,
            f02: false,
            f03: "x",
            f04: null,
            f05: true,
            f06: "y",
            f07: 7,
            f08: true,
            f09: "z",
            f10: 20,
            f11: null,
            f12: "a",
            f13: 77,
            f14: false,
            f15: "b",
            f16: null
        };
    }
}