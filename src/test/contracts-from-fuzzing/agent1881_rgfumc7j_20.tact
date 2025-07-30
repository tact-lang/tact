struct OptionalStringBool {
    s: String?;
    b: Bool?;
}

contract OptStringBoolTest {
    x: OptionalStringBool;

    init() {
        self.x = OptionalStringBool{ s: null, b: null };
    }
}