struct DefaultsOptional {
    foo: Int? = null;
    bar: Bool? = null;
    baz: Int = 42;
    qux: Bool = true;
}

contract DefaultsOptionalContract {
    data: DefaultsOptional;

    init() {
        self.data = DefaultsOptional{};
    }

    receive() {}
}