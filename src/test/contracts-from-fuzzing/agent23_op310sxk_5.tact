struct LongFlat {
    a1: Int as uint8;
    a2: Int as uint8;
    a3: Int as uint8;
    a4: Int as uint8;
    a5: Int as uint8;
    a6: Int as uint8;
    a7: Int as uint8;
    a8: Int as uint8;
    a9: Int as uint8;
    a10: Int as uint8;
    a11: Int as uint8;
    a12: Int as uint8;
    a13: Int as uint8;
    a14: Int as uint8;
    a15: Int as uint8;
    a16: Int as uint8;
    a17: Int as uint8;
    a18: Int as uint8;
    a19: Int as uint8;
    a20: Int as uint8;
}

contract TestFlatStruct {
    receive() {
        let x = LongFlat {
            a1: 1,  a2: 1,  a3: 1,  a4: 1,  a5: 1,
            a6: 1,  a7: 1,  a8: 1,  a9: 1,  a10: 1,
            a11: 1, a12: 1, a13: 1, a14: 1, a15: 1,
            a16: 1, a17: 1, a18: 1, a19: 1, a20: 1
        };
        let sum = x.a1 + x.a2 + x.a3 + x.a4 + x.a5 + x.a6 + x.a7 + x.a8 + x.a9 + x.a10 + x.a11 + x.a12 + x.a13 + x.a14 + x.a15 + x.a16 + x.a17 + x.a18 + x.a19 + x.a20;
        dump(sum);
    }
}
