struct WithDefaults {
    a: Int = 42;
    b: Bool = false;
    s: String = "hello";
}

contract TestContract {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}