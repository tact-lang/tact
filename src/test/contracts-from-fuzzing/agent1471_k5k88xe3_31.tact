struct WithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
}

contract DefaultsInit {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}