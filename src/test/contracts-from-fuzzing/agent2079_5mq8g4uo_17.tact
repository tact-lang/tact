struct WithDefaults {
    i: Int = 5;
    s: String = "hi";
    b: Bool = true;
}

contract TestContract {
    val: WithDefaults;
    init() {
        self.val = WithDefaults{};
    }
}