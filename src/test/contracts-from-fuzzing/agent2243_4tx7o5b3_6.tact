struct EmbeddedBool {
    x: Bool;
    y: Int;
}

contract BoolFieldTest {
    state: EmbeddedBool;

    init() {
        self.state = EmbeddedBool{
            x: false,
            y: -123
        };
    }
}
