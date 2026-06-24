struct NestedDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "";
    d: Address?;
    e: Bool?;
}

contract TestContract {
    val: NestedDefaults;

    init() {
        self.val = NestedDefaults{};
    }
}