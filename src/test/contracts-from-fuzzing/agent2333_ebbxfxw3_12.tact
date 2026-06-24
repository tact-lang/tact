struct OptionalString {
    foo: String?;
}

contract TestOptionalStr {
    state: OptionalString;
    init() {
        self.state = OptionalString{
            foo: null
        };
    }
}