struct OptionalNested {
    name: String?;
}

contract OptTest {
    x: OptionalNested?;

    init() {
        self.x = null;
    }
}
