contract DefaultValuesTest {
    n: Int = 10;
    b: Bool = true;
    s: String = "hello";

    init() {
        self.n = 20;
        self.b = false;
        self.s = "world";
    }
}