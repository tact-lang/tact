struct LargeStruct {
    f0: Int;
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
}

contract TestLongFlat {
    receive() {
        let a: LargeStruct = LargeStruct{
            f0: 1, f1: 1, f2: 1, f3: 1, f4: 1,
            f5: 1, f6: 1, f7: 1, f8: 1, f9: 1,
            f10: 1, f11: 1, f12: 1, f13: 1, f14: 1
        };
        let sum: Int = a.f0 + a.f1 + a.f2 + a.f3 + a.f4 + a.f5 + a.f6 + a.f7 + a.f8 + a.f9 + a.f10 + a.f11 + a.f12 + a.f13 + a.f14;
    }
}
