struct HasDefaults {
    a: Int = 0;
    b: String = "";
    c: Bool = false;
    d: Int?; // implicit null
    e: String?; // implicit null
    f: Bool?; // implicit null
}

contract DefaultsTest {
    field: HasDefaults;

    init() {
        self.field = HasDefaults{};
    }
}