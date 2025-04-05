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
}

contract TestLongFlat {
    receive() {
        let s: LongFlat = LongFlat {
            f1: 1,
            f2: 2,
            f3: 3,
            f4: 4,
            f5: 5,
            f6: 6,
            f7: 7,
            f8: 8,
            f9: 9,
            f10: 10
        };
        let sum = s.f1 + s.f2 + s.f3 + s.f4 + s.f5 + s.f6 + s.f7 + s.f8 + s.f9 + s.f10;
    }
}
