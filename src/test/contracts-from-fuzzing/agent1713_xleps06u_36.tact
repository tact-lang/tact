contract InitExpressionFuzz {
    a: Int;
    b: Int;
    c: Int;

    init() {
        self.a = (1 << 128) + (1 << 64);
        self.b = (1 << 255) - 1;
        self.c = -(1 << 255);
    }
}