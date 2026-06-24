struct Defaults {
    a: Int = 1;
    b: Bool = true;
    s: String = "";
}

contract StructDefaults {
    d: Defaults;

    init() {
        self.d = Defaults{};
    }
}