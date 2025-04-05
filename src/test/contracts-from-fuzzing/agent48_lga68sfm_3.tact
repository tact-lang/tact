struct FlatStruct {
    A1: Int;
    A2: Int;
    A3: Int;
    A4: Int;
    A5: Int;
    A6: Int;
    A7: Int;
    A8: Int;
    A9: Int;
    A10: Int;
    A11: Int;
    A12: Int;
    A13: Int;
    A14: Int;
    A15: Int;
    A16: Int;
    A17: Int;
    A18: Int;
    A19: Int;
    A20: Int;
    A21: Int;
    A22: Int;
    A23: Int;
    A24: Int;
    A25: Int;
    A26: Int;
    A27: Int;
    A28: Int;
    A29: Int;
    A30: Int;
}

fun testFlat(): Int {
    let s = FlatStruct {
        A1: 1, A2: 1, A3: 1, A4: 1, A5: 1, A6: 1, A7: 1, A8: 1, A9: 1, A10: 1,
        A11: 1, A12: 1, A13: 1, A14: 1, A15: 1, A16: 1, A17: 1, A18: 1, A19: 1, A20: 1,
        A21: 1, A22: 1, A23: 1, A24: 1, A25: 1, A26: 1, A27: 1, A28: 1, A29: 1, A30: 1
    };
    return s.A1 + s.A30;
}

contract TestFlatStruct {
    receive() {
        testFlat();
    }
}
