struct OptionalString {
    a: String?;
    b: Int;
}

contract Test {
    foo: OptionalString;

    init() {
        self.foo = OptionalString{
            a: null,
            b: 5
        };
    }
}