struct HasDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "test";
}

contract StructDefaults {
    d: HasDefaults;

    init() {
        self.d = HasDefaults{}; // uses only defaults
    }
}