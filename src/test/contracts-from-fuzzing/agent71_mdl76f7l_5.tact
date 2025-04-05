struct LongFlat {
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
}

contract TestLongFlat {
    receive() {
        let lf = LongFlat { 
            f1: 1, f2: 2, f3: 3, f4: 4, f5: 5, f6: 6, f7: 7, f8: 8, f9: 9, f10: 10,
            f11: 11, f12: 12, f13: 13, f14: 14, f15: 15
        };
        let sum = lf.f1 + lf.f2 + lf.f3 + lf.f4 + lf.f5 + lf.f6 + lf.f7 + lf.f8 + lf.f9 + lf.f10 + lf.f11 + lf.f12 + lf.f13 + lf.f14 + lf.f15;
        dump(sum);
    }
}
