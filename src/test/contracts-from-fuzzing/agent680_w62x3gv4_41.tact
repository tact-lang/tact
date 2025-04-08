contract ChainAssign {
    a: Int;
    b: Int;
    c: Int;

    init() {
        self.a = 1;
        self.b = self.a + 1;
        self.c = self.b + 1;
    }

    receive() {
        let _ = self.c + 1;
    }
}