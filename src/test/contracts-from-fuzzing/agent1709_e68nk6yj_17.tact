struct HasDefaults {
    a: Int = 42;
    b: String = "hello";
    c: Bool?; // null default
}

contract StructWithDefaults {
    data: HasDefaults;
    init() {
        self.data = HasDefaults{};
    }
}