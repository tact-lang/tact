struct NestedDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "abc";
    d: Int?;
}

contract Test {
    val: NestedDefaults;
    init() {
        self.val = NestedDefaults{};
    }
}