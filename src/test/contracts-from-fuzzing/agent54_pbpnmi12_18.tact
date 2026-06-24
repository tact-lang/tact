contract BoolDefaultTest {
    b: Bool = true;
    b2: Bool = false;

    init() {
        self.b = false;
        self.b2 = true;
    }
}