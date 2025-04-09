contract BoolDefaultsTest {
    f1: Bool = true;
    f2: Bool = false;
    f3: Bool? = null;

    init() {
        self.f1 = false;
        self.f2 = true;
        self.f3 = true;
    }
}