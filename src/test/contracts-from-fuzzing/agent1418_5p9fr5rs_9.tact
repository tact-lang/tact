struct SwithDefaults {
    a: Int = 42;
    b: Bool = false;
    c: String = "default";
}

contract DefaultsInNested {
    s: SwithDefaults;

    init() {
        self.s = SwithDefaults{};
    }
}