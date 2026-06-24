struct WithDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "ok";
}

contract DefaultsHolder {
    x: WithDefaults;

    init() {
        self.x = WithDefaults{};
    }
}