struct S1 {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: Int;
    f6: Bool;
}

contract Combo {
    comboField: S1;

    init() {
        self.comboField = S1{
            f1: 1,
            f2: true,
            f3: null,
            f4: null,
            f5: 5,
            f6: false,
        };
    }

    receive() {
        self.comboField = S1{
            f1: 10,
            f2: false,
            f3: 3,
            f4: true,
            f5: -5,
            f6: true,
        };
    }
}