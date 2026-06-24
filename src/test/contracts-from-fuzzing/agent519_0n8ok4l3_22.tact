contract OptionalDefaultsTest {
    x: Int? = null;
    y: Bool? = null;

    init() {
        self.x = 12;
        self.y = true;
    }
}