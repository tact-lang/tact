struct SDefault {
    a: Int = 1;
    b: Bool = true;
    c: String = "x";
}

contract HasDefaults {
    info: SDefault;

    init() {
        self.info = SDefault{};
    }
}
