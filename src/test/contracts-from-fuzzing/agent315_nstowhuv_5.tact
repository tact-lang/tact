struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
}

contract DefaultsContract {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}