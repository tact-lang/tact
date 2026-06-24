struct HasDefaults {
    x: Int = 12;
    y: Bool = true;
    s: String = "default";
}

contract DefaultStructField {
    v: HasDefaults;

    init() {
        self.v = HasDefaults{};
    }

    receive() {}
}