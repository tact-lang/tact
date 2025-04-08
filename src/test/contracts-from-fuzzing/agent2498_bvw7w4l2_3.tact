contract TestContract {
    bigInt: Int as int257;
    smallInt: Int as int8;
    uInt: Int as uint128;
    coin: Int as coins;
    ok: Bool;
    txt: String;

    init() {
        self.bigInt = 5555555555555;
        self.smallInt = 127;
        self.uInt = 123456789;
        self.coin = ton("1");
        self.ok = true;
        self.txt = "test";
    }
}