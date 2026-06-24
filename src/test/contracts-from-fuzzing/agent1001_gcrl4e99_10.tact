contract DefaultsTest {
    a: Int = 42;
    b: String = "abc";
    c: Bool = true;
    d: Int? = null;
    e: Bool? = false;

    init() {
        self.a = 7;
        self.b = "def";
        self.c = false;
        self.d = 555;
        self.e = null;
    }
}