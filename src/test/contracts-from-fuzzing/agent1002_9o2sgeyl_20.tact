struct DefaultOption {
    foo: Int? = null;
    bar: Bool? = true;
}

contract OptDefaults {
    data: DefaultOption;

    init() {
        self.data = DefaultOption{};
    }
}