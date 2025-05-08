struct HasDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "abc";
    d: Int?; // implicitly null
    e: String?; // implicitly null
}

contract DefFields {
    field: HasDefaults;

    init() {
        self.field = HasDefaults{};
    }
}
