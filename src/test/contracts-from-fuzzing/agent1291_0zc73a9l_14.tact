struct SDefault {
    a: Int = 10;
    b: Bool = false;
    c: String = "default";
}

contract Test {
    s: SDefault;

    init() {
        self.s = SDefault{};
    }
}