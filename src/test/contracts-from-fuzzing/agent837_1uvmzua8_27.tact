struct SDefault {
    x: Int = 12;
    y: Bool = true;
}

contract StructDefaults {
    s: SDefault;
    init() {
        self.s = SDefault{};
    }
}