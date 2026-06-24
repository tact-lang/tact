struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "";
    d: Int?; // implicit null
}

contract HasDefaults {
    f: NestedDefaults;

    init() {
        self.f = NestedDefaults{};
    }
}