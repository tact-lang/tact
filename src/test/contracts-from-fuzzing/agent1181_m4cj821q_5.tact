contract TestContract {
    bigInt1: Int as int257;
    bigInt2: Int as uint256;
    smallInt: Int as int8;
    boo: Bool;
    text: String;

    init() {
        self.bigInt1 = 0;
        self.bigInt2 = 1;
        self.smallInt = -5;
        self.boo = false;
        self.text = "hello";
    }
}