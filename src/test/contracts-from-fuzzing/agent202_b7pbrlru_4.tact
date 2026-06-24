struct OptionalFields {
    foo: Int?;
    bar: Bool?;
}

contract OptionalVars {
    state: OptionalFields;
    init() {
        self.state = OptionalFields{
            foo: null,
            bar: true
        };
    }
    receive() {
        if (self.state.foo != null) {
            let _ = self.state.foo!!;
        }
        if (self.state.bar != null) {
            let _ = self.state.bar!!;
        }
    }
}