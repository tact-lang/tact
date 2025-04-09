struct HasDefaults {
    a: Int = 100;
    b: Bool = false;
    c: String = "str";
}

contract TestContract {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}