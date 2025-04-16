contract OptionalOrigins {
    pa: Int?;
    pb: Int?;
    pc: Int?;

    init() {
        self.pa = null;
        self.pb = 123;
        self.pc = null;
    }

    receive() {
        self.pa = 1;
    }
}