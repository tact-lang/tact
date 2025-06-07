struct HasDefaults {
    i: Int = 42;
    b: Bool = true;
    s: String = "hi";
}

contract DefaultsInStructInit {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}