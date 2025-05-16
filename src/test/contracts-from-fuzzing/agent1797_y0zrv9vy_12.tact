struct S {
    bigInt: Int;
    smallInt: Int as uint8;
    bigAgain: Int;
}

contract Test {
    s: S;
    init() {
        self.s = S{ bigInt: 12345678901234567890, smallInt: 255, bigAgain: -99999999 };
    }
}