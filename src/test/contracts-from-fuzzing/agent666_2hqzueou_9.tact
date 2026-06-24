contract OptionalBoolTest {
    a: Bool?;
    b: Bool = false;

    init() {
        self.a = null;
        self.b = true;
    }
}