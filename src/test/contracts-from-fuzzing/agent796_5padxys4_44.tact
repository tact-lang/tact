struct SDefault {
    a: Int = 1;
    b: Int?;
}

contract UseDefaults {
    s: SDefault;
    init() {
        self.s = SDefault{};
    }
}