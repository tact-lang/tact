struct BitsAndPieces {
    flag1: Bool;
    number1: Int as uint4;
    number2: Int as int64;
    number3: Int as uint8;
    flag2: Bool;
}

contract TestContract {
    bits: BitsAndPieces;

    init() {
        self.bits = BitsAndPieces{
            flag1: true,
            number1: 7,
            number2: 123456,
            number3: 255,
            flag2: false
        };
    }
}
