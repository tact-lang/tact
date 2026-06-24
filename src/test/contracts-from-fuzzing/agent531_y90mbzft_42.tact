contract ChainAssign {
    a: Int = 1;

    init() {
        self.a = 5;
        self.a = 8;
        self.a = -7;
    }
}