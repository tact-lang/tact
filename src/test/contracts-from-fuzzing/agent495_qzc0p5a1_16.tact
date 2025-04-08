struct OptBoolContainer {
    foo: Bool?;
}

contract OptionalBoolTest {
    state: OptBoolContainer;

    init() {
        self.state = OptBoolContainer{ foo: null };
    }
}