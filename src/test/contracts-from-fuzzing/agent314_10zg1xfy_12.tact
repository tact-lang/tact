struct NestedWithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
    d: Int?;
}

contract NestedDefaultsStorage {
    val: NestedWithDefaults;
    init() {
        self.val = NestedWithDefaults{};
    }
}