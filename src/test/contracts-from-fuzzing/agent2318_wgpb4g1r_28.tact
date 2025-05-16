contract TestContract {
    a: Int = 1;
    b: Int? = null;
    c: Int as int64 = 2;
    d: Int? as int64 = null;

    init() {
        self.a = 10;
        self.b = 20;
        self.c = 30;
        self.d = 40;
    }
}
