struct BigStruct {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Int;
    f8: Int;
    f9: Int;
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
    f21: Int;
    f22: Int;
    f23: Int;
    f24: Int;
    f25: Int;
    f26: Int;
    f27: Int;
    f28: Int;
    f29: Int;
    f30: Int;
    f31: Int;
    f32: Int;
}

contract BigStructStorage {
    big: BigStruct = BigStruct{
        f1: 0, f2: 0, f3: 0, f4: 0, f5: 0, f6: 0, f7: 0, f8: 0,
        f9: 0, f10: 0, f11: 0, f12: 0, f13: 0, f14: 0, f15: 0, f16: 0,
        f17: 0, f18: 0, f19: 0, f20: 0, f21: 0, f22: 0, f23: 0, f24: 0,
        f25: 0, f26: 0, f27: 0, f28: 0, f29: 0, f30: 0, f31: 0, f32: 0,
    };

    init() {
        self.big = self.big;
    }
}