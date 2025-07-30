contract WeirdSerialize {
    a: Int as uint8;
    b: Int as int257;
    c: Int as uint32;
    d: Int;

    init() {
        self.a = 5;
        self.b = 100;
        self.c = 30000;
        self.d = 42;
    }
}