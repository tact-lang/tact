struct OptionalDefaulted {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
    e: Cell? = null;
}

contract StructWithOptionalDefaults {
    val: OptionalDefaulted;

    init() {
        self.val = OptionalDefaulted{};
    }
}