struct HasDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "hello";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract StructWithDefaults {
    f: HasDefaults;

    init() {
        self.f = HasDefaults{};
    }
}
