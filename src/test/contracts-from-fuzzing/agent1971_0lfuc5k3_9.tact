struct WithDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "default";
    d: Int?;  // implicit null
    e: Bool?; // implicit null
}

contract StructWithDefaults {
    s: WithDefaults;

    init() {
        self.s = WithDefaults{};
    }
}
