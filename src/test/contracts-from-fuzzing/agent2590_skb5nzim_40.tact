struct OptionalWithDefault {
    a: Int? = 5;
}

contract OptionalWithDefaultContract {
    foo: OptionalWithDefault;
    init() {
        self.foo = OptionalWithDefault{};
    }
}