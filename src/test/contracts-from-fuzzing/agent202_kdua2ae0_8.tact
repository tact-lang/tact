contract FieldDefaultsTest {
    a: Int = 7;
    b: Bool = false;
    c: String = "hello";

    init() {
        self.a = 42;
        self.b = true;
        self.c = "override";
    }
}