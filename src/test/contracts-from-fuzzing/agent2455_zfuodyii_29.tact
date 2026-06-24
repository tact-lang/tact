contract BoolIntStorage {
    a: Bool;
    b: Int;
    c: Bool?;
    d: Int?;

    init() {
        self.a = true;
        self.b = 7;
        self.c = null;
        self.d = null;
    }
}