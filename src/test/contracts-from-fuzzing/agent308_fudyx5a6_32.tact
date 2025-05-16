struct OptionalBool {
    b: Bool?;
}

contract OptBoolTest {
    val: OptionalBool;

    init() {
        self.val = OptionalBool { b: null };
    }
}
