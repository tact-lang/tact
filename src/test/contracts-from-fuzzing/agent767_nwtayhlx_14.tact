struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NullTest {
    state: OptionalFields?;

    init() {
        self.state = null;
    }
}
