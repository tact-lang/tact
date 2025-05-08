struct BigTestStruct {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Int;
    f5: Bool;
    f6: Address;
    f7: Int;
    f8: Bool;
    f9: Address;
    f10: Int;
    f11: Bool;
    f12: Address;
    f13: Int;
    f14: Bool;
    f15: Address;
    f16: Int;
    f17: Bool;
    f18: Address;
}

contract TestContract {
    big: BigTestStruct;

    init() {
        self.big = BigTestStruct{
            f1: 1,
            f2: true,
            f3: myAddress(),
            f4: 2,
            f5: false,
            f6: myAddress(),
            f7: 3,
            f8: true,
            f9: myAddress(),
            f10: 4,
            f11: false,
            f12: myAddress(),
            f13: 5,
            f14: true,
            f15: myAddress(),
            f16: 6,
            f17: false,
            f18: myAddress(),
        };
    }
}