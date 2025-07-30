contract DefaultsTest {
    i: Int = 123;
    b: Bool = true;
    s: String = "hi";

    init() {
        self.i = 456;
        self.b = false;
        self.s = "bye";
    }
}
