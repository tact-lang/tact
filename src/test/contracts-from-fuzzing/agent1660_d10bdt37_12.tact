struct NestedDefaults {
    a: Int = 10;
    b: Bool = false;
    c: String = "x";
}

contract Test12 {
    val: NestedDefaults;
    init() {
        self.val = NestedDefaults{};
    }
}