struct HugeStruct {
    f01: Int;
    f02: Int;
    f03: Int;
    f04: Int;
    f05: Int;
    f06: Int;
    f07: Int;
    f08: Int;
    f09: Int;
    f10: Int;

    f11: Int;
    f12: Int;
    f13: Int;
    f14: Int;
    f15: Int;
    f16: Int;
    f17: Int;
    f18: Int;
    f19: Int;
    f20: Int;
} 

contract TestHuge {
    data: HugeStruct;

    init() {
        self.data = HugeStruct{
            f01: 1, f02: 2, f03: 3, f04: 4, f05: 5, f06: 6, f07: 7, f08: 8, f09: 9, f10: 10,
            f11: 11, f12: 12, f13: 13, f14: 14, f15: 15, f16: 16, f17: 17, f18: 18, f19: 19, f20: 20,
        };
    }

    receive() {
        self.data = HugeStruct{
            f01: 21, f02: 22, f03: 23, f04: 24, f05: 25, f06: 26, f07: 27, f08: 28, f09: 29, f10: 30,
            f11: 31, f12: 32, f13: 33, f14: 34, f15: 35, f16: 36, f17: 37, f18: 38, f19: 39, f20: 40,
        };
    }
}