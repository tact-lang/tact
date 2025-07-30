struct ADefault {
    x: Int = 7;
    y: String = "default";
    b: Bool = false;
}

contract ManyDefaults {
    data: ADefault;

    init() {
        self.data = ADefault{};
    }
}