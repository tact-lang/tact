contract OrderTest {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int;

    init() {
        self.d = self.a + self.b + self.c;
    }
}