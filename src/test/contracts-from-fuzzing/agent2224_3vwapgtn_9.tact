struct SDefault {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
}

contract Test9 {
    s: SDefault;
    init() {
        self.s = SDefault{};
    }
}