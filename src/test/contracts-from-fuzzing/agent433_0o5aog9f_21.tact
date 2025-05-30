contract TestContract {
    a: Int = 1;
    b: Int? = null;
    c: Int as uint8 = 5;
    d: Int? = null;

    init() {
        self.a = 42;
        self.b = 100;
        self.c = 255;
        self.d = 128;
    }
}