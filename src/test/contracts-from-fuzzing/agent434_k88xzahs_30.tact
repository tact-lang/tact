struct Defaults {
    val: Int = 0;
    text: String = "";
    flag: Bool = false;
}

contract WithDefaults {
    s: Defaults;

    init() {
        self.s = Defaults{};
    }
}