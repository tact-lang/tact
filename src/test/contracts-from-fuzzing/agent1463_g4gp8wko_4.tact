struct OptNested {
    a: Int;
    b: String?;
}

contract OptNestedTest {
    maybe: OptNested?;

    init() {
        self.maybe = null;
    }
}
