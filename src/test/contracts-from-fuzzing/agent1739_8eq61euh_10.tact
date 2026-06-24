struct BoolIntMix {
    flag1: Bool;
    flag2: Bool;
    num1: Int;
    flag3: Bool;
    num2: Int;
}

contract Test {
    data: BoolIntMix;

    init() {
        self.data = BoolIntMix{
            flag1: true,
            flag2: false,
            num1: 123,
            flag3: true,
            num2: 456
        };
    }
}
