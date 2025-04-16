contract OptionalStateVars {
    a: Int?;
    b: Bool?;
    c: Address?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}
