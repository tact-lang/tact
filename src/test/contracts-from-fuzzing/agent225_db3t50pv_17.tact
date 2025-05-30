struct HasDefaults {
    a: Int = 1;
    b: Bool = false;
    s: String = "hello";
}

contract DefaultsContract {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}