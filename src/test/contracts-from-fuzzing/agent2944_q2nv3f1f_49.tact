contract OptionalDefaultsRepeat {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;

    init() {
        self.a = 2;
        self.b = "k";
        self.c = true;
    }
}