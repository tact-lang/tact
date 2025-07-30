contract NullDefaultsTest {
    a: Int? = null;
    b: String? = null;

    init() {
        self.a = 42;
        self.b = "set";
    }
}