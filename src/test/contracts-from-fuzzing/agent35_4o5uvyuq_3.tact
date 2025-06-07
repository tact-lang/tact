struct LongStruct {
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

fun test_sum(s: LongStruct): Int {
    return s.f1 + s.f2 + s.f3 + s.f4 + s.f5 + s.f6 + s.f7 + s.f8 + s.f9 + s.f10 + s.f11 + s.f12 + s.f13 + s.f14 + s.f15;
}

contract TestContract {
    receive() {
        let s: LongStruct = LongStruct{f1: 1, f2: 2, f3: 3, f4: 4, f5: 5, f6: 6, f7: 7, f8: 8, f9: 9, f10: 10, f11: 11, f12: 12, f13: 13, f14: 14, f15: 15};
        let res = test_sum(s);
    }
}
