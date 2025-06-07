struct DefaultsNested {
    n: Int? = null;
    str: String = "hi";
    b: Bool = false;
}

contract WithDefaults {
    state: DefaultsNested;

    init() {
        self.state = DefaultsNested{};
    }
}