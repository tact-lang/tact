contract InvalidSerialization {
    a: Int as coins;
    b: String;
    c: Bool;
    init() {
        self.a = 1;
        self.b = "bad";
        self.c = true;
    }
}