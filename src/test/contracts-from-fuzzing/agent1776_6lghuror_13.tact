contract TestContract {
    bigInt: Int as int257;
    smallInt: Int as uint4;
    midInt: Int as int16;
    coinInt: Int as coins;

    init() {
        self.bigInt = 12345678901234567890;
        self.smallInt = 15;
        self.midInt = -12345;
        self.coinInt = ton("1.5");
    }

    receive() {
        let _ = self.coinInt;
    }
}