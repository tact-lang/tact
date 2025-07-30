struct ManyFields {
    a0: Int = 0;
    a1: Int = 1;
    a2: Int = 2;
    a3: Int = 3;
    a4: Int = 4;
    a5: Int = 5;
    a6: Int = 6;
    a7: Int = 7;
    a8: Int = 8;
    a9: Int = 9;
    a10: Int = 10;
    a11: Int = 11;
    a12: Int = 12;
    a13: Int = 13;
    a14: Int = 14;
    a15: Int = 15;
}

contract LargeStructHolder {
    s: ManyFields;

    init() {
        self.s = ManyFields{
            a0: 10,
            a1: 11,
            a2: 12,
            a3: 13,
            a4: 14,
            a5: 15,
            a6: 16,
            a7: 17,
            a8: 18,
            a9: 19,
            a10: 20,
            a11: 21,
            a12: 22,
            a13: 23,
            a14: 24,
            a15: 25
        };
    }
}