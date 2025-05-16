struct OptBool {
    b: Bool?;
}

contract OptionalBoolTest {
    field: OptBool;

    init() {
        self.field = OptBool{ b: true };
    }
}