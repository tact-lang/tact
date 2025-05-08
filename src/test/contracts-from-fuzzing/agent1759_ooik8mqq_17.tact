struct OptStr {
    s: String?;
}

contract OptionalStringTest {
    field: OptStr;

    init() {
        self.field = OptStr{ s: null };
    }
}
