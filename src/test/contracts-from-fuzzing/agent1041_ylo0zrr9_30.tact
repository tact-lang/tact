struct DefaultsOptional {
    a: Int? = null;
    b: Int = 0;
    c: Bool = true;
    d: Bool? = null;
    e: String = "test";
}

contract OptionWithDefaults {
    data: DefaultsOptional;

    init() {
        self.data = DefaultsOptional{};
    }
}
