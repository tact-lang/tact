struct HasDefaults {
    a: Int = 5;
    b: Bool = false;
    s: String = "hi";
}

contract HasStructDefaults {
    foo: HasDefaults;

    init() {
        self.foo = HasDefaults{};
    }
}