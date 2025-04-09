struct BigStruct {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Int;
    f8: Int;
    f9: Int;
    f10: Int;
    f11: Int;
    f12: Int;
    f13: Int;
    f14: Int;
    f15: Int;
    f16: Int;
    f17: Int;
    f18: Int;
    f19: Int;
    f20: Int;
}

contract ManyFields {
    s: BigStruct;

    init() {
        self.s = BigStruct{
            f1: 10,
            f2: 20,
            f3: 30,
            f4: 40,
            f5: 50,
            f6: 60,
            f7: 70,
            f8: 80,
            f9: 90,
            f10: 100,
            f11: 110,
            f12: 120,
            f13: 130,
            f14: 140,
            f15: 150,
            f16: 160,
            f17: 170,
            f18: 180,
            f19: 190,
            f20: 200
        };
    }
}