struct Defaulted {
    x: Int = 5;
    y: Bool = true;
    z: String = "default";
}

contract WithDefaults {
    s: Defaulted;

    init() {
        self.s = Defaulted{};
    }
}