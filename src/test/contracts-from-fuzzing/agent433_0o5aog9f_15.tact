struct HasDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "default";
}

contract TestContract {
    d: HasDefaults;

    init() {
        self.d = HasDefaults{};
    }
}