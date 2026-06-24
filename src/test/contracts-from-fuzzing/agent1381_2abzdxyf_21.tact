contract TestContract {
    a: Int as uint8;
    b: Int as int64;
    c: Int;
    d: Bool;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = true;
    }
}