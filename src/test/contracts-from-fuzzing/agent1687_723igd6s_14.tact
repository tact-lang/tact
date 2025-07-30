contract CoinTypes {
    a: Int as coins;
    b: Int as uint124;
    c: Int;

    init() {
        self.a = 10_000;
        self.b = 123456;
        self.c = 789;
    }
}