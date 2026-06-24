contract OpenClose {
    a: Int;
    b: Int;

    init() {
        self.a = 1;
        self.b = 2;
        self.a = 3;
        self.b = 4;
    }
}