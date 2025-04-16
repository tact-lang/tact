struct NestedDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
    d: Int? = null;
    e: Bool? = null;
    f: Address? = null;
}

contract TestContract {
    val: NestedDefaults;
    init() {
        self.val = NestedDefaults{};
    }
}