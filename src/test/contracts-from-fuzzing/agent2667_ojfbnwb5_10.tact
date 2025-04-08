struct LargeStruct {
    f01: Int; f02: Int; f03: Int; f04: Int; f05: Int;
    f06: Int; f07: Int; f08: Int; f09: Int; f10: Int;
    f11: Bool; f12: Bool; f13: Bool; f14: Bool; f15: Bool;
    f16: Bool; f17: Bool; f18: Bool; f19: Bool; f20: Bool;
}

contract LargeStructFields {
    big: LargeStruct;
    
    init() {
        self.big = LargeStruct{
            f01: 1, f02: 2, f03: 3, f04: 4, f05: 5,
            f06: 6, f07: 7, f08: 8, f09: 9, f10: 10,
            f11: true, f12: false, f13: true, f14: false, f15: true,
            f16: false, f17: true, f18: false, f19: true, f20: false
        };
    }
    
    receive() {
        self.big = LargeStruct{
            f01: 11, f02: 12, f03: 13, f04: 14, f05: 15,
            f06: 16, f07: 17, f08: 18, f09: 19, f10: 20,
            f11: false, f12: true, f13: false, f14: true, f15: false,
            f16: true, f17: false, f18: true, f19: false, f20: true
        };
    }
}