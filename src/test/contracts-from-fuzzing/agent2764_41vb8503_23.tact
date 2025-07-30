struct SDefault {
    x: Int = 0;
    y: String = "";
    z: Bool = false;
    a: Int?; // null default
}

contract DefaultsUsage {
    s: SDefault;

    init() {
        self.s = SDefault{};
    }
}