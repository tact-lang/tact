struct NestedDefaults {
    a: Int? = null;
    b: Bool = true;
    c: String = "abc";
}

contract DefStructStorage {
    s: NestedDefaults;

    init() {
        self.s = NestedDefaults{};
    }
}