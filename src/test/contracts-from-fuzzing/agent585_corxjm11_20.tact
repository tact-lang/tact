struct SDefault {
    a: Int = 5;
    b: Bool = false;
    c: String = "abc";
}

contract NestedDefaultsInContract {
    s: SDefault = SDefault{};

    init() {
        self.s = SDefault{};
    }
}
