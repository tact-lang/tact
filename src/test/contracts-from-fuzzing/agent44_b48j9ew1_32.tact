contract DefaultZeroes {
    a: Int = 0;
    b: Int = 0;
    c: Int = 0;

    init() {
        self.a = 10;
        self.b = 20;
        self.c = 30;
    }

    receive() {
        self.a = self.a + 1;
    }
}