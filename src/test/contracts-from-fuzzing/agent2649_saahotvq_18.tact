struct AllNullDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptNullDefaults {
    val: AllNullDefaults;

    init() {
        self.val = AllNullDefaults{};
    }
}