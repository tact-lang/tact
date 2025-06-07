struct OptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract Test14 {
    opt: OptDefaults;
    init() {
        self.opt = OptDefaults{};
    }
}