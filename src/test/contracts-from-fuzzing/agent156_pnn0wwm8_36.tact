contract OptionalDefaultMixed {
    a: Int? = null;
    b: Bool = false;
    c: String? = "hello";
    d: Bool? = null;

    init() {
        self.a = 5;
        self.d = true;
    }
}
