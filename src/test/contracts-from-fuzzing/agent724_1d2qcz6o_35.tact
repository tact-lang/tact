struct MostlyDefaults {
    x: Int = 5;
    y: Int? = null;
    z: Bool = true;
    s: String = "hello";
    t: String? = null;
}

contract TestContract {
    md: MostlyDefaults;

    init() {
        self.md = MostlyDefaults{};
    }
}