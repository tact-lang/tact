contract LongStringDefaults {
    a: String = "abcdefghij";
    b: String = "klmnopqrst";
    c: String = "uvwxyz1234";
    d: String = "567890abcd";

    init() {
        self.a = "A";
        self.b = "B";
        self.c = "C";
        self.d = "D";
    }
}