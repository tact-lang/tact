contract ChainOptionAssign {
    a: Int?;
    b: Int?;
    c: Int?;

    init() {
        self.a = null;
        self.b = self.a;
        self.c = self.b;
    }
}