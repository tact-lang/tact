contract EdgeIntBits {
    a: Int as int1 = 0;
    b: Int as int257 = 42;

    init() {
        self.a = 1; // max for int1
        self.b = 12345;
    }
}