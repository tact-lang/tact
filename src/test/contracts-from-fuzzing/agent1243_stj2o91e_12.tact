contract TestContract {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
    f: Int = 6;
    g: Int = 7;
    h: Int = 8;
    i: Int = 9;
    j: Int = 10;

    init() {
        self.a = 100;
        self.j = 200;
    }

    receive() {
        dump(self.a + self.j);
    }
}