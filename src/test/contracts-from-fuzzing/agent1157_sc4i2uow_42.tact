contract OptionalStringFlat {
    a: String?;
    b: String?;
    c: String?;
    d: String?;

    init() {
        self.a = "one";
        self.b = null;
        self.c = "three";
        self.d = null;
    }
}