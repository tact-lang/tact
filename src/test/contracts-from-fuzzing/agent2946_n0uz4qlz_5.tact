struct LargeStruct {
    f01: Int;
    f02: Bool;
    f03: Int?;
    f04: Bool?;
    f05: Int;
    f06: Bool;
    f07: Int?;
    f08: Bool?;
    f09: Int;
    f10: Bool;
    f11: Int?;
    f12: Bool?;
    f13: Int;
    f14: Bool;
    f15: Int?;
    f16: Bool?;
}

contract HasManyFields {
    data: LargeStruct;
    init() {
        self.data = LargeStruct{
            f01: 1, f02: true, f03: null, f04: null,
            f05: 2, f06: false, f07: null, f08: null,
            f09: 3, f10: true, f11: null, f12: null,
            f13: 4, f14: false, f15: null, f16: null
        };
    }
}