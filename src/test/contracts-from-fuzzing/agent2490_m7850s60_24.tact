struct HasDefaults {
    a: Int = 42;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultsStructContract {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}