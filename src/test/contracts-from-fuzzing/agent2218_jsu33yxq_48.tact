struct IntsDefaults {
    a: Int = 0;
    b: Int = -1;
    c: Int = 1;
}

contract Test {
    data: IntsDefaults;
    init() {
        self.data = IntsDefaults{};
    }
}