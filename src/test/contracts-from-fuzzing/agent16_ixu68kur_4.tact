struct LargeFlat {
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
    f20: Int
}

fun sum(l: LargeFlat): Int {
    return l.f1 + l.f2 + l.f3 + l.f4 + l.f5 + l.f6 + l.f7 + l.f8 + l.f9 + l.f10 +
           l.f11 + l.f12 + l.f13 + l.f14 + l.f15 + l.f16 + l.f17 + l.f18 + l.f19 + l.f20;
}

contract TestLongStruct {
    receive() {
         let a: LargeFlat = LargeFlat{ 
            f1: 1, f2: 1, f3: 1, f4: 1, f5: 1, f6: 1, f7: 1, f8: 1, f9: 1, f10: 1,
            f11: 1, f12: 1, f13: 1, f14: 1, f15: 1, f16: 1, f17: 1, f18: 1, f19: 1, f20: 1 
         };
         sum(a);
    }
}
