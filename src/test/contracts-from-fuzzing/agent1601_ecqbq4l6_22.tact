struct WithDefaults {
    a: Int = 42;
    b: Bool = false;
    c: String = "hi";
}

contract WithDefaultStruct {
    val: WithDefaults;
    init() {
        self.val = WithDefaults{};
    }
}