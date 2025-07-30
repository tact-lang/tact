contract OptTest {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
    s: String? = null;

    init() {
        self.a = 42;
        self.b = true;
        self.c = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.s = "set";
    }
}