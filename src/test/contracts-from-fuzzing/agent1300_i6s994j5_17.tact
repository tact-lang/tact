struct OptFatty {
    f01: Int?; f02: Int?; f03: Int?; f04: Int?; f05: Int?;
    f06: Int?; f07: Int?; f08: Int?; f09: Int?; f10: Int?;
    f11: Int?; f12: Int?; f13: Int?; f14: Int?; f15: Int?;
    f16: Int?; f17: Int?; f18: Int?; f19: Int?; f20: Int?;
}

contract OptFatStruct {
    fat: OptFatty = OptFatty{
        f01: null, f02: null, f03: null, f04: null, f05: null,
        f06: null, f07: null, f08: null, f09: null, f10: null,
        f11: null, f12: null, f13: null, f14: null, f15: null,
        f16: null, f17: null, f18: null, f19: null, f20: null
    };
}