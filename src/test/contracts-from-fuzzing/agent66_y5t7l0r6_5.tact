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
    F11: Int;
    F12: Int;
    F13: Int;
    F14: Int;
    F15: Int;
    F16: Int;
    F17: Int;
    F18: Int;
    F19: Int;
    F20: Int;
}

contract TestLongFlat {
    receive() {
        let a: LongFlat = LongFlat { 
            F1: 1, F2: 2, F3: 3, F4: 4, F5: 5,
            F6: 6, F7: 7, F8: 8, F9: 9, F10: 10,
            F11: 11, F12: 12, F13: 13, F14: 14, F15: 15,
            F16: 16, F17: 17, F18: 18, F19: 19, F20: 20
        };
    }
}
