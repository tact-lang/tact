contract FieldsNoDefaults {
    a: Int;
    b: String;
    c: Bool;

    init() {
        self.a = 42;
        self.b = "hello";
        self.c = true;
    }
}