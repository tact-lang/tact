// Initialize persistent optional to null explicitly in declaration
contract ExplicitNulls {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}
