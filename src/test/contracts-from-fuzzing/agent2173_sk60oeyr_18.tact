contract OptionalDefaultTest {
    a: Int? = null;
    b: Int? = 10;
    c: Int?; // uninitialized, should be null by implicit default

    init() {
        self.a = null;
        self.b = 20;
        self.c = 30;
    }
}