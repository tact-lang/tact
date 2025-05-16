struct ManyFlags {
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
    f33: Bool;
    f34: Bool;
    f35: Bool;
    f36: Bool;
    f37: Bool;
    f38: Bool;
    f39: Bool;
    f40: Bool;
    f41: Bool;
    f42: Bool;
    f43: Bool;
    f44: Bool;
    f45: Bool;
    f46: Bool;
    f47: Bool;
    f48: Bool;
    f49: Bool;
    f50: Bool;
}

contract TestContract {
    flags: ManyFlags;

    init() {
        self.flags = ManyFlags{
            f1: true, f2: false, f3: true, f4: false, f5: true,
            f6: false, f7: true, f8: false, f9: true, f10: false,
            f11: true, f12: false, f13: true, f14: false, f15: true,
            f16: false, f17: true, f18: false, f19: true, f20: false,
            f21: true, f22: false, f23: true, f24: false, f25: true,
            f26: false, f27: true, f28: false, f29: true, f30: false,
            f31: true, f32: false, f33: true, f34: false, f35: true,
            f36: false, f37: true, f38: false, f39: true, f40: false,
            f41: true, f42: false, f43: true, f44: false, f45: true,
            f46: false, f47: true, f48: false, f49: true, f50: false,
        };
    }
}