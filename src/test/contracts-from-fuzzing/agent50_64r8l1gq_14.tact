struct SWithDefaults {
    x: Int = 5;
    y: Bool = false;
}

contract DefaultsInStorage {
    data: SWithDefaults;

    init() {
        self.data = SWithDefaults{};
    }
}