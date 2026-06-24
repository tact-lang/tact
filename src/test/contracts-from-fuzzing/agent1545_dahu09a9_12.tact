struct Defaults {
    a: Int = 1;
    b: String = "hi";
    c: Bool = true;
}

contract WithDefaults {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}
