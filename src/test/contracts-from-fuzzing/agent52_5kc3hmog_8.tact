struct MegaFlat {
    f1: Int;  f2: Int;  f3: Int;  f4: Int;  f5: Int;
    f6: Int;  f7: Int;  f8: Int;  f9: Int;  f10: Int;
    f11: Int; f12: Int; f13: Int; f14: Int; f15: Int;
    f16: Int; f17: Int; f18: Int; f19: Int; f20: Int;
    f21: Int; f22: Int; f23: Int; f24: Int; f25: Int;
    f26: Int; f27: Int; f28: Int; f29: Int; f30: Int;
    f31: Int; f32: Int; f33: Int; f34: Int; f35: Int;
    f36: Int; f37: Int; f38: Int; f39: Int; f40: Int;
    f41: Int; f42: Int; f43: Int; f44: Int; f45: Int;
    f46: Int; f47: Int; f48: Int; f49: Int; f50: Int;
}

fun sumMegaFlat(m: MegaFlat): Int {
    return m.f1 + m.f2 + m.f3 + m.f4 + m.f5 +
           m.f6 + m.f7 + m.f8 + m.f9 + m.f10 +
           m.f11 + m.f12 + m.f13 + m.f14 + m.f15 +
           m.f16 + m.f17 + m.f18 + m.f19 + m.f20 +
           m.f21 + m.f22 + m.f23 + m.f24 + m.f25 +
           m.f26 + m.f27 + m.f28 + m.f29 + m.f30 +
           m.f31 + m.f32 + m.f33 + m.f34 + m.f35 +
           m.f36 + m.f37 + m.f38 + m.f39 + m.f40 +
           m.f41 + m.f42 + m.f43 + m.f44 + m.f45 +
           m.f46 + m.f47 + m.f48 + m.f49 + m.f50;
}

contract TestMegaFlat {
    receive() {
         let m: MegaFlat = MegaFlat {
            f1: 1,   f2: 2,   f3: 3,   f4: 4,   f5: 5,
            f6: 6,   f7: 7,   f8: 8,   f9: 9,   f10: 10,
            f11: 11, f12: 12, f13: 13, f14: 14, f15: 15,
            f16: 16, f17: 17, f18: 18, f19: 19, f20: 20,
            f21: 21, f22: 22, f23: 23, f24: 24, f25: 25,
            f26: 26, f27: 27, f28: 28, f29: 29, f30: 30,
            f31: 31, f32: 32, f33: 33, f34: 34, f35: 35,
            f36: 36, f37: 37, f38: 38, f39: 39, f40: 40,
            f41: 41, f42: 42, f43: 43, f44: 44, f45: 45,
            f46: 46, f47: 47, f48: 48, f49: 49, f50: 50
         };
         let s = sumMegaFlat(m);
         s;
    }
}
