struct OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
    e: Cell? = null;
    f: Slice? = null;
}

contract Test23 {
    val: OptionalDefaults;

    init() {
        self.val = OptionalDefaults{};
    }
}