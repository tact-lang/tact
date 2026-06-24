struct WithDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
}

contract TestContract {
    val: WithDefaults;
    init() {
        self.val = WithDefaults{};
    }
}