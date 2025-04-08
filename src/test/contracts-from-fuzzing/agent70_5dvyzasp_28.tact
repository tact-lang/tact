struct SDefault {
    a: Int = 3;
    b: Bool = false;
    c: String? = null;
}

contract C {
    s: SDefault;

    init() {
        self.s = SDefault{};
    }
}