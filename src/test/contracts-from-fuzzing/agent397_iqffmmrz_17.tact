struct WithDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "abc";
}

contract TestContract {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}