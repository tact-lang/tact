contract FieldsOptionalAndDefault {
    a: Int?;
    b: Int = 42;
    c: String?;
    d: String = "def";

    init() {
        self.a = null;
        self.b = 777;
        self.c = null;
        self.d = "mod";
    }
}
