struct Flags {
    f0: Int as uint1;
    f1: Int as uint1;
    f2: Int as uint1;
    f3: Int as uint1;
    f4: Int as uint1;
    f5: Int as uint1;
    f6: Int as uint1;
    f7: Int as uint1;
    f8: Int as uint1;
    f9: Int as uint1;
    f10: Int as uint1;
    f11: Int as uint1;
    f12: Int as uint1;
    f13: Int as uint1;
    f14: Int as uint1;
    f15: Int as uint1;
    f16: Int as uint1;
    f17: Int as uint1;
    f18: Int as uint1;
    f19: Int as uint1;
    f20: Int as uint1;
    f21: Int as uint1;
    f22: Int as uint1;
    f23: Int as uint1;
    f24: Int as uint1;
    f25: Int as uint1;
    f26: Int as uint1;
    f27: Int as uint1;
    f28: Int as uint1;
    f29: Int as uint1;
    f30: Int as uint1;
    f31: Int as uint1;
}

contract TestContract {
    flags: Flags = Flags{
        f0:0,f1:1,f2:0,f3:1,f4:0,f5:1,f6:0,f7:1,
        f8:0,f9:1,f10:0,f11:1,f12:0,f13:1,f14:0,f15:1,
        f16:0,f17:1,f18:0,f19:1,f20:0,f21:1,f22:0,f23:1,
        f24:0,f25:1,f26:0,f27:1,f28:0,f29:1,f30:0,f31:1
    };

    init() {
        self.flags = Flags{
            f0:1,f1:0,f2:1,f3:0,f4:1,f5:0,f6:1,f7:0,
            f8:1,f9:0,f10:1,f11:0,f12:1,f13:0,f14:1,f15:0,
            f16:1,f17:0,f18:1,f19:0,f20:1,f21:0,f22:1,f23:0,
            f24:1,f25:0,f26:1,f27:0,f28:1,f29:0,f30:1,f31:0
        };
    }

    receive() {
        let _ = self.flags;
    }
}