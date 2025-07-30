struct HasDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int?; // default null
    e: Bool?; // default null
}

contract DefaultsTest {
    storage: HasDefaults;

    init() {
        self.storage = HasDefaults{};
    }
}
