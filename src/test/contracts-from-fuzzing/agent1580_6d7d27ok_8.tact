contract DefaultOptFields {
    s: HasDefaults;

    init() {
        self.s = HasDefaults{};
    }
}

struct HasDefaults {
    x: Int = 5;
    y: String?;
    z: Bool = true;
}