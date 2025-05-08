struct ManyOptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
    e: Cell? = null;
}

contract OptDefs {
    val: ManyOptionalDefaults;

    init() {
        self.val = ManyOptionalDefaults{};
    }
}
