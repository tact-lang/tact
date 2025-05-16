struct LongFlat {
    F1: Int;
    F2: Int;
    F3: Int;
    F4: Int;
    F5: Int;
    F6: Int;
    F7: Int;
    F8: Int;
    F9: Int;
    F10: Int;
}

contract TestLongFlat {
    receive() {
        let lf: LongFlat = LongFlat{
            F1: 1, F2: 2, F3: 3, F4: 4, F5: 5,
            F6: 6, F7: 7, F8: 8, F9: 9, F10: 10
        };
    }
}
