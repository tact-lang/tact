struct HasDefaults {
    a: Int = 42;
    b: Bool = true;
    c: Int?;
    d: Bool? = false;
}

contract TestDefaults {
    data: HasDefaults;
    init() {
        self.data = HasDefaults{
            c: null,
        };
    }
}