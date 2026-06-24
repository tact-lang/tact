contract OptionalDefaultedField {
    a: Int? = null;
    b: String? = null;

    init() {
        self.a = null;
        self.b = null;
    }
}
