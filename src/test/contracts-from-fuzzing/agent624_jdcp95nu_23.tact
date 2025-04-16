contract LargeOptionalInit {
    a: Int? = 1;
    b: Bool? = true;
    c: String? = "text";

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}