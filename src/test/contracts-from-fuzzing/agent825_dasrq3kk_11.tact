struct HasDefaults {
    a: Int = 1;
    b: Bool = false;
    c: Int?; // default null
}

contract Test {
    f: HasDefaults;

    init() {
        self.f = HasDefaults{
            // omit all fields, should use defaults
        };
    }
}