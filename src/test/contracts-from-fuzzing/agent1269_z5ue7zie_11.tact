contract TestContract {
    f1: Int as int8 = 5;
    f2: Int as uint64 = 100;
    f3: Int as int257 = 123456789;

    init() {
        self.f1 = -10;
        self.f2 = 50000;
        self.f3 = -987654321;
    }
}