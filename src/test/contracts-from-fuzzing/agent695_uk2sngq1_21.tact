struct WithDefaults {
    a: Int = 1;
    b: String = "x";
    c: Bool = false;
}

contract DefaultsInStorage {
    d: WithDefaults;

    init() {
        self.d = WithDefaults{};
    }
}