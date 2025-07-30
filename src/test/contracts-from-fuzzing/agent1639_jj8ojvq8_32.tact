contract DefaultsTest {
    a: Int = -1;
    b: Bool = true;
    c: String = "default";

    init() {
        self.a = 1;
        self.b = false;
        self.c = "changed";
    }
}
