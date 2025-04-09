struct SDefault {
    a: Int = 10;
    b: Bool = true;
    c: String = "test";
}

contract WithDefaults {
    data: SDefault;

    init() {
        self.data = SDefault{};
    }
}