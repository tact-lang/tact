struct SDefault {
    x: Int = 5;
    y: Bool = true;
    s: String = "test";
}

contract UseDefaults {
    data: SDefault;
    init() {
        self.data = SDefault{};
    }
}