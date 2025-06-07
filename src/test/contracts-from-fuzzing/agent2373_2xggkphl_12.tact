struct Defaulted {
    count: Int = 5;
    label: String = "default";
}

contract WithDefaults {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}