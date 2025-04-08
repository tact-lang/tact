struct MultiDefaults {
    a: Int = 1;
    b: Bool = false;
    s: String = "";
}

contract DefaultInitialization {
    data: MultiDefaults;

    init() {
        self.data = MultiDefaults{};
    }
}