struct ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hey";
}

contract DefaultsContainer {
    data: ManyDefaults;

    init() {
        self.data = ManyDefaults{};
    }
}
