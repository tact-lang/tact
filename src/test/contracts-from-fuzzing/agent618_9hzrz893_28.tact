struct ManyOptionDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = null;
}

contract NestedOptDefaults {
    val: ManyOptionDefaults;

    init() {
        self.val = ManyOptionDefaults{};
    }
}