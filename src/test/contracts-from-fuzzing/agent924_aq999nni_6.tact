struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "default";
    d: Int?; // null by default
}

contract DefaultFields {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}