// test a struct with long list of fields and deeply nested struct embedded in last field
struct DeepNest {
    x: Int = 5;
    y: String = "Y";
}

struct LongOne {
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
    a16: Int = 16;
    nest: DeepNest;
}

contract TestContract {
    data: LongOne;
    init() {
        self.data = LongOne{
            a0: 100,
            a1: 101,
            a2: 102,
            a3: 103,
            a4: 104,
            a5: 105,
            a6: 106,
            a7: 107,
            a8: 108,
            a9: 109,
            a10: 110,
            a11: 111,
            a12: 112,
            a13: 113,
            a14: 114,
            a15: 115,
            a16: 116,
            nest: DeepNest{x: 999, y: "NN"},
        };
    }
}
