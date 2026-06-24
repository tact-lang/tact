contract DefaultsTest {
    a: Int = 10;
    b: Bool = true;
    c: String = "text";

    init() {
        self.a = 11;
        self.b = false;
        self.c = "changed";
    }
}
