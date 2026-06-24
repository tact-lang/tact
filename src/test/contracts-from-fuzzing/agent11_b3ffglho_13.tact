struct Flat20 {
    a1: Int as uint32;
    a2: Int as uint32;
    a3: Int as uint32;
    a4: Int as uint32;
    a5: Int as uint32;
    a6: Int as uint32;
    a7: Int as uint32;
    a8: Int as uint32;
    a9: Int as uint32;
    a10: Int as uint32;
    a11: Int as uint32;
    a12: Int as uint32;
    a13: Int as uint32;
    a14: Int as uint32;
    a15: Int as uint32;
    a16: Int as uint32;
    a17: Int as uint32;
    a18: Int as uint32;
    a19: Int as uint32;
    a20: Int as uint32;
}

contract Test {
    receive() {
        let s: Flat20 = Flat20{
            a1: 1, a2: 2, a3: 3, a4: 4, a5: 5, a6: 6, a7: 7, a8: 8, a9: 9, a10: 10,
            a11: 11, a12: 12, a13: 13, a14: 14, a15: 15, a16: 16, a17: 17, a18: 18, a19: 19, a20: 20
        };
    }
}
