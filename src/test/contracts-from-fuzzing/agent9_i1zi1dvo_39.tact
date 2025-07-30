struct OptionalDefaulted {
    v: Int? = null;
}

contract OptionalDefaultedField {
    opt: OptionalDefaulted;
    init() {
        self.opt = OptionalDefaulted{};
    }
}