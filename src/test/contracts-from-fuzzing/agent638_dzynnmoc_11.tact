struct Fat {
    f1: Int = 1;
    f2: Int = 2;
    f3: Int? = null;
    f4: Bool = true;
    f5: Bool? = null;
    f6: String = "a";
    f7: String? = null;
    f8: Int as uint8 = 8;
    f9: Int as int8 = -8;
    f10: Int? = null;
    f11: String = "b";
    f12: Bool = false;
    f13: Int = 13;
    f14: Int as uint4 = 4;
    f15: Int = 15;
    f16: Int? = null;
    f17: Bool? = true;
    f18: String? = null;
    f19: Int = 19;
    f20: Int = 20;
}

contract FatStructStorage {
    data: Fat = Fat{
        f1: 1, f2: 2, f3: null, f4: true, f5: null, f6: "a", f7: null,
        f8: 8, f9: -8, f10: null, f11: "b", f12: false, f13: 13,
        f14: 4, f15: 15, f16: null, f17: true, f18: null, f19: 19, f20: 20
    };

    init() {} 
}