contract TestContract {
    bigInt: Int = 1234567890123456789012345678901234567890;
    smallInt: Int as uint8 = 255;
    flag: Bool = false;
    text: String = "test";
    maybeText: String? = null;
    maybeAddr: Address? = null;

    init() {
        self.flag = true;
        self.maybeAddr = null;
    }
}
