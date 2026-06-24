struct Flat {
    f1: Int;  f2: Int;  f3: Int;  f4: Int;  f5: Int;
    f6: Int;  f7: Int;  f8: Int;  f9: Int;  f10: Int;
    f11: Int; f12: Int; f13: Int; f14: Int; f15: Int;
    f16: Int; f17: Int; f18: Int; f19: Int; f20: Int;
}

fun sumFlat(flat: Flat): Int {
    return flat.f1 + flat.f2 + flat.f3 + flat.f4 + flat.f5 +
           flat.f6 + flat.f7 + flat.f8 + flat.f9 + flat.f10 +
           flat.f11 + flat.f12 + flat.f13 + flat.f14 + flat.f15 +
           flat.f16 + flat.f17 + flat.f18 + flat.f19 + flat.f20;
}

contract TestFlat {
    receive() {
         let flat: Flat = Flat {
            f1: 1,  f2: 2,  f3: 3,  f4: 4,  f5: 5,
            f6: 6,  f7: 7,  f8: 8,  f9: 9,  f10: 10,
            f11: 11, f12: 12, f13: 13, f14: 14, f15: 15,
            f16: 16, f17: 17, f18: 18, f19: 19, f20: 20
         };
         let total = sumFlat(flat);
         total;
    }
}
