struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: Address? = null;
    d: String = "test";
}

contract DefaultsContract {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}