struct Defaults {
    s: String = "d";
    flag: Bool = true;
    val: Int = 5;
}

contract WithDefaults {
    embedded: Defaults;

    init() {
        self.embedded = Defaults{};
    }
}