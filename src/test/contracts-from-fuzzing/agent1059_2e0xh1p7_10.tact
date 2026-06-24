struct WithDefaults {
    a: Int = 42;
    b: Bool = false;
    c: String = "default";
    d: Int? = null;
}

contract TestContract {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}