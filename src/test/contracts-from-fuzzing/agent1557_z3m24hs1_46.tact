struct OptionalBoolTest {
    a: Bool?;
    b: Bool;
}

contract BoolOptionalMix {
    s: OptionalBoolTest;

    init() {
        self.s = OptionalBoolTest{ a:null, b: true };
    }
}