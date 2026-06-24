contract Mix {
    a: Int as int128;
    b: Int?;
    c: Bool;
    d: String?;

    init() {
        self.a = 100;
        self.b = null;
        self.c = true;
        self.d = null;
    }
}