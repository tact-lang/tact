contract OptionalBoolDefaultTest {
    b: Bool?;

    init() {
        self.b = true;
        self.b = null;
    }
}