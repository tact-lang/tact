struct HugeStruct {
    f1: Int;      f2: Int?;
    f3: Int;      f4: Int?;
    f5: Int;      f6: Int?;
    f7: Int;      f8: Int?;
    f9: Int;      f10: Int?;
    f11: Int;     f12: Int?;
    f13: Int;     f14: Int?;
    f15: Int;     f16: Int?;
    f17: Int;     f18: Int?;
    f19: Int;     f20: Int?;
    f21: Int;     f22: Int?;
    f23: Int;     f24: Int?;
    f25: Int;     f26: Int?;
    f27: Int;     f28: Int?;
    f29: Int;     f30: Int?;
    f31: Int;     f32: Int?;
    f33: Int;     f34: Int?;
    f35: Int;     f36: Int?;
    f37: Int;     f38: Int?;
    f39: Int;     f40: Int?;
    f41: Int;     f42: Int?;
    f43: Int;     f44: Int?;
    f45: Int;     f46: Int?;
    f47: Int;     f48: Int?;
    f49: Int;     f50: Int?;
}

contract HugeStorage {
    state: HugeStruct;
    
    init() {
        self.state = HugeStruct{
            f1: 1,      f2: null,
            f3: 3,      f4: null,
            f5: 5,      f6: null,
            f7: 7,      f8: null,
            f9: 9,      f10: null,
            f11: 11,    f12: null,
            f13: 13,    f14: null,
            f15: 15,    f16: null,
            f17: 17,    f18: null,
            f19: 19,    f20: null,
            f21: 21,    f22: null,
            f23: 23,    f24: null,
            f25: 25,    f26: null,
            f27: 27,    f28: null,
            f29: 29,    f30: null,
            f31: 31,    f32: null,
            f33: 33,    f34: null,
            f35: 35,    f36: null,
            f37: 37,    f38: null,
            f39: 39,    f40: null,
            f41: 41,    f42: null,
            f43: 43,    f44: null,
            f45: 45,    f46: null,
            f47: 47,    f48: null,
            f49: 49,    f50: null,
        };
    }
}