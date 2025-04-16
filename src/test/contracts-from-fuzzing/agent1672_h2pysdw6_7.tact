struct DefaultFields {
    foo: Int = 1;
    bar: Bool = false;
    baz: String = "hi";
}

contract DefaultStructContract {
    f: DefaultFields;

    init() {
        self.f = DefaultFields{};
    }
}