struct Large {
    F1: Int; F2: Int; F3: Int; F4: Int; F5: Int; F6: Int; F7: Int; F8: Int; F9: Int; F10: Int;
    F11: Int; F12: Int; F13: Int; F14: Int; F15: Int; F16: Int; F17: Int; F18: Int; F19: Int; F20: Int;
    F21: Int; F22: Int; F23: Int; F24: Int; F25: Int; F26: Int; F27: Int; F28: Int; F29: Int; F30: Int;
}

contract TestLargeStruct {
    receive() {
        let s = Large{
            F1: 1, F2: 2, F3: 3, F4: 4, F5: 5, F6: 6, F7: 7, F8: 8, F9: 9, F10: 10,
            F11: 11, F12: 12, F13: 13, F14: 14, F15: 15, F16: 16, F17: 17, F18: 18, F19: 19, F20: 20,
            F21: 21, F22: 22, F23: 23, F24: 24, F25: 25, F26: 26, F27: 27, F28: 28, F29: 29, F30: 30
        };
        let sum = s.F1 + s.F2 + s.F3 + s.F4 + s.F5 + s.F6 + s.F7 + s.F8 + s.F9 + s.F10 +
                  s.F11 + s.F12 + s.F13 + s.F14 + s.F15 + s.F16 + s.F17 + s.F18 + s.F19 + s.F20 +
                  s.F21 + s.F22 + s.F23 + s.F24 + s.F25 + s.F26 + s.F27 + s.F28 + s.F29 + s.F30;
        sum;
    }
}
