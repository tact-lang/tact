struct HasDefaults {
    a: Int = 42;
    b: String = "hello";
    c: Bool = false;
}

contract TestContract {
    d: HasDefaults;

    init() {
        self.d = HasDefaults{};
    }
}