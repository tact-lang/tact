struct NullDefaults {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
    c: Cell? = null;
}

contract Test15 {
    val: NullDefaults;
    init() {
        self.val = NullDefaults{};
    }
}