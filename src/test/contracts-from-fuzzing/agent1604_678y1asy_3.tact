struct S {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
    flag5: Bool;
    flag6: Bool;
    flag7: Bool;
    flag8: Bool;
    flag9: Bool;
    flag10: Bool;
    flag11: Bool;
    flag12: Bool;
    flag13: Bool;
    flag14: Bool;
    flag15: Bool;
    flag16: Bool;
    flag17: Bool;
    flag18: Bool;
    flag19: Bool;
    flag20: Bool;
}

contract ManyBools {
    s: S;

    init() {
        self.s = S{
            flag1: false, flag2: false, flag3: false, flag4: false, flag5: false,
            flag6: false, flag7: false, flag8: false, flag9: false, flag10: false,
            flag11: false, flag12: false, flag13: false, flag14: false, flag15: false,
            flag16: false, flag17: false, flag18: false, flag19: false, flag20: false
        };
    }
}