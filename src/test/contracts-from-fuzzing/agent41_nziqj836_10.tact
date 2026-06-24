struct HasDefaults {
    a: Int = 42;
    b: Bool = true;
    s: String = "abc";
}

contract TestContract {
    state: HasDefaults;

    init() {
        self.state = HasDefaults{};
    }

    receive() {
        self.state;
    }
}