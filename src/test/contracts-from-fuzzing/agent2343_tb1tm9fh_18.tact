struct SDefault {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultsInStructAndAssign {
    s: SDefault;

    init() {
        self.s = SDefault{};
    }
}
