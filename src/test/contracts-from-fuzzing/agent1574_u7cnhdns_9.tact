struct Defaults {
    x: Int = 1;
    y: Int = 2;
    z: Bool = false;
    s: String = "abc";
}

contract StructDefaults {
    d: Defaults;

    init() {
        self.d = Defaults{};
    }
}