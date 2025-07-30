struct ADef {
    i: Int = 1;
    b: Bool = false;
    s: String = "hi";
}

contract WithDefaults {
    state: ADef;

    init() {
        self.state = ADef{};
    }
}