struct Big {
    p0: Int;
    p1: Int;
    p2: Int;
    p3: Int;
    p4: Int;
    p5: Int;
    p6: Int;
    p7: Int;
    p8: Int;
    p9: Int;
    p10: Int;
    p11: Int;
    p12: Int;
    p13: Int;
    p14: Int;
    p15: Int;
}

contract BigTest {
    field: Big;

    init() {
        self.field = Big{
            p0: 0,
            p1: 1,
            p2: 2,
            p3: 3,
            p4: 4,
            p5: 5,
            p6: 6,
            p7: 7,
            p8: 8,
            p9: 9,
            p10: 10,
            p11: 11,
            p12: 12,
            p13: 13,
            p14: 14,
            p15: 15,
        };
    }

    receive() {}
}