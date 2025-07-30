struct WithDefaults {
    a: Int = 42;
    b: Bool = false;
    s: String = "hello";
}

contract DefaultsContract {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}