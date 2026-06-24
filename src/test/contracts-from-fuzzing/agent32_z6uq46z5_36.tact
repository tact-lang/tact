struct HasBool {
    b: Bool;
}

contract OptionalStructFieldTest {
    s: HasBool?;

    init() {
        self.s = null;
    }
}
