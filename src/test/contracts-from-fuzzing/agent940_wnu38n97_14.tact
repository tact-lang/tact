contract TestContract {
    bigInt: Int = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    smallInt: Int as uint8 = 255;
    negativeInt: Int as int16 = -32768;
    condition: Bool = true;

    init() {
        self.bigInt = 1;
        self.smallInt = 5;
        self.negativeInt = -1;
        self.condition = false;
    }
}