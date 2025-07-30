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
}

contract Test {
    receive() {
        let s: FlatStruct = FlatStruct{
            A1: 1,  A2: 2,  A3: 3,  A4: 4,  A5: 5,
            A6: 6,  A7: 7,  A8: 8,  A9: 9,  A10: 10,
            A11: 11, A12: 12, A13: 13, A14: 14, A15: 15,
            A16: 16, A17: 17, A18: 18, A19: 19, A20: 20
        };
    }
}
