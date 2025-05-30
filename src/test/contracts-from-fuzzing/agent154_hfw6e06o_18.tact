struct WithDefaults {
    a: Int = 5;
    b: Bool = true;
    s: String = "hello";
}

contract DefaultsContract {
    d: WithDefaults;

    init() {
        self.d = WithDefaults{};
    }
}