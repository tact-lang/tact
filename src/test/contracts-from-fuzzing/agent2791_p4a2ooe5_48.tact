contract FieldsInit {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;

    init() {
        self.a = 7;
        self.b = true;
        self.c = "seven";
        self.d = null;
    }
}
