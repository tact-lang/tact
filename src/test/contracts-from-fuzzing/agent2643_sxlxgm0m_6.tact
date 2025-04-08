struct OptDefaults {
    intOpt: Int? = null;
    boolOpt: Bool? = null;
    cellOpt: Cell? = null;
    sliceOpt: Slice? = null;
    strOpt: String? = null;
    addrOpt: Address? = null;
}

contract OptDefContract {
    data: OptDefaults;

    init() {
        self.data = OptDefaults{};
    }
}
