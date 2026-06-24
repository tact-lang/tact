contract NullableAfterDefault {
    a: Int? = 7;
    b: String? = "x";

    init() {
        self.a = null;
        self.b = null;
    }
}
