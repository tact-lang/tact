struct WithDefaults {
    val: Int = 42;
    text: String = "hello";
    flag: Bool = false;
}

contract DefaultsInStructContract {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}