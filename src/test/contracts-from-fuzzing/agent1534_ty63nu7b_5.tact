contract MultiPrimitiveFields {
    foo: Int;
    bar: Bool;
    addr: Address;
    coins: Int as coins;
    flag: Bool;
    str: String;

    init() {
        self.foo = 1;
        self.bar = true;
        self.addr = myAddress();
        self.coins = 5;
        self.flag = false;
        self.str = "test";
    }
}