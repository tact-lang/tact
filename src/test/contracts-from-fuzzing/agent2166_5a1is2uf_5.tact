struct Defaulted {
    foo: Int = 1;
    bar: Bool = true;
    message: String = "Hello";
}

contract TestWithDefaults {
    def: Defaulted;

    init() {
        self.def = Defaulted{};
    }
}
