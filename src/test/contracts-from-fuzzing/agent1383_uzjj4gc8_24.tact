contract OptionalFieldsDefault {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;

    init() {
        self.a = 5;
        self.b = false;
        self.c = "filled";
    }
}