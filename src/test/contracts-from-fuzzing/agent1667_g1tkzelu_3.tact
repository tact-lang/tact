struct Params {
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
}

contract Flags {
    params: Params;

    init() {
        self.params = Params{
            flag1: true, flag2: false, flag3: true, flag4: false,
            flag5: true, flag6: false, flag7: true, flag8: false,
            flag9: true, flag10: false, flag11: true, flag12: false,
            flag13: true, flag14: false, flag15: true, flag16: false
        };
    }
}
