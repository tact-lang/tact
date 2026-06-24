struct Defaults {
    x: Int = 5;
    y: Bool = false;
}

contract StructDefaults {
    d: Defaults;

    init() {
        self.d = Defaults{};
    }
}