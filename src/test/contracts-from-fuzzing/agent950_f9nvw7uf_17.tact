struct WithDefaults {
    a: Int = 1;
    b: Int?;
    c: Bool?;
    d: String = "abc";
    e: String?;
}

contract DefaultsNest {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}