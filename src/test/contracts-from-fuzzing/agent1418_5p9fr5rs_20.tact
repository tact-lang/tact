struct Nullables {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
}

contract NullableDefaults {
    n: Nullables;

    init() {
        self.n = Nullables{};
    }
}