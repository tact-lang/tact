contract BoolSerializeDefaults {
    a: Bool = true;
    b: Bool = false;
    c: Bool = true;

    init() {
        self.a = false;
        self.b = true;
        self.c = false;
    }
}