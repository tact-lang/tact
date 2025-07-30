struct SDefault {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
}

contract Test30 {
    s: SDefault;

    init() {
        self.s = SDefault{};
    }
}