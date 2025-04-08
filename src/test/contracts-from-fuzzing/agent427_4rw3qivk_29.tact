struct OptionalString {
    data: String?;
}

contract PersistOptString {
    foo: OptionalString;

    init() {
        self.foo = OptionalString{
            data: null
        };
    }
}