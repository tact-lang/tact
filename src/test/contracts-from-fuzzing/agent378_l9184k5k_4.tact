struct WithDefaults {
    a: Int = 7;
    b: Bool = false;
    c: String = "test";
}

contract OptionalDefaultsTest {
    item: WithDefaults?;

    init() {
        self.item = null;
    }
}