contract FieldsAsOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;

    init() {
        self.a = 123;
        self.b = null;
        self.c = true;
    }
}
