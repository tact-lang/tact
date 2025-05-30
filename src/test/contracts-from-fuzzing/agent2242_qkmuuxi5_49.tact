contract ChainOptionalAssign {
    a: Int?;

    init() {
        self.a = null;
        self.a = 1;
        self.a = null;
        self.a = 42;
    }
}