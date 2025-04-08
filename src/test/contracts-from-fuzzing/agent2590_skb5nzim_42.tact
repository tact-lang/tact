struct IntOptionalExplicitNull {
    x: Int? = null;
}

contract IntOptNullContract {
    foo: IntOptionalExplicitNull;
    init() {
        self.foo = IntOptionalExplicitNull{};
    }
}