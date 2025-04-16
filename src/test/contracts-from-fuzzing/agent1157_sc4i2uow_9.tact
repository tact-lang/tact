struct MultiDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = ""
}

contract DefaultsContract {
    x: MultiDefaults;

    init() {
        self.x = MultiDefaults{};
    }
}