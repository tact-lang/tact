struct WithOptAndDefaults {
    a: Int = 3;
    b: Int?; // default null
    c: Bool?; // default null
    d: String = "nice";
}

contract StructMixedInit {
    data: WithOptAndDefaults;

    init() {
        self.data = WithOptAndDefaults{};
    }
}
