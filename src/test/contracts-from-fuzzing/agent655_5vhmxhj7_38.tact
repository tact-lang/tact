// optional primitives with explicit default assignments
contract ExplicitOptionalDefaults {
    x1: Int? = null;
    x2: Bool? = false;
    x3: String? = null;

    init() {
        self.x1 = null;
        self.x2 = false;
        self.x3 = null;
    }
}