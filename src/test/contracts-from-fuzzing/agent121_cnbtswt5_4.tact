struct HasDefaults {
    f1: Int = 42;
    f2: String = "hello";
    f3: Bool = true;
}

contract TestContract {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}
