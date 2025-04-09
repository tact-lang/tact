struct LargeBoolStruct {
    f1: Bool;
    f2: Bool;
    f3: Bool;
    f4: Bool;
    f5: Bool;
    f6: Bool;
    f7: Bool;
    f8: Bool;
    f9: Bool;
    f10: Bool;
    f11: Bool;
    f12: Bool;
    f13: Bool;
    f14: Bool;
    f15: Bool;
    f16: Bool;
    f17: Bool;
    f18: Bool;
    f19: Bool;
    f20: Bool;
    f21: Bool;
    f22: Bool;
    f23: Bool;
    f24: Bool;
    f25: Bool;
    f26: Bool;
    f27: Bool;
    f28: Bool;
    f29: Bool;
    f30: Bool;
    f31: Bool;
    f32: Bool;
}

contract TestContract {
    data: LargeBoolStruct;

    init() {
        self.data = LargeBoolStruct{
            f1: true, f2: true, f3: true, f4: true, f5: true, f6: true, f7: true, f8: true,
            f9: true, f10: true, f11: true, f12: true, f13: true, f14: true, f15: true, f16: true,
            f17: true, f18: true, f19: true, f20: true, f21: true, f22: true, f23: true, f24: true,
            f25: true, f26: true, f27: true, f28: true, f29: true, f30: true, f31: true, f32: true,
        };
    }
}