struct OptionalsDefault {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Cell? = null;
    e: Slice? = null;
    f: Address? = null;
}

contract TestContract {
    optdef: OptionalsDefault;

    init() {
        self.optdef = OptionalsDefault{};
    }
}