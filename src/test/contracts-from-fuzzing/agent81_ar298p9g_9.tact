contract TestContract {
    a: Int = 0;
    b: Int as uint8 = 1;
    c: Int as int64 = 2;
    d: Int as uint256 = 3;

    init() {
        self.a = 4;
        self.b = 5;
        self.c = 6;
        self.d = 7;
    }
}