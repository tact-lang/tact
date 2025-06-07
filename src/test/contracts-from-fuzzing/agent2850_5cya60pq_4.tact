struct OptNested {
    name: String?;
    flag: Bool?;
}

contract OptionalNestedTest {
    data: OptNested;

    init() {
        self.data = OptNested{ name: null, flag: null };
    }
}