struct SDefault {
    a: Int = 1;
    b: Int = 2;
    c: Bool = false;
}

contract Test {
    val: SDefault;
    init() {
        self.val = SDefault{};
    }
}