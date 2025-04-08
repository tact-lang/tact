struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "def";
    d: Int? = null;
    e: Bool? = null;
}

contract TestContract {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}