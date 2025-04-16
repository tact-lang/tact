struct TestDefaults {
    i: Int = 999;
    b: Bool = true;
    s: String = "string";
}

contract Test41 {
    val: TestDefaults;
    init() {
        self.val = TestDefaults{};
    }
}