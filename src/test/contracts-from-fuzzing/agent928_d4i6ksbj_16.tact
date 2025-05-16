struct HasDefaults {
    x: Int = 5;
    y: Bool = false;
    s: String = "hi";
}

contract DefaultedStructField {
    d: HasDefaults;

    init() {
        self.d = HasDefaults{};
    }
}