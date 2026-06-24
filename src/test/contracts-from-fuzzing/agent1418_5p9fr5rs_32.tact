contract MixedNestedPersistence {
    a: Int?;
    b: Bool;
    c: String?;
    d: Int as uint64;
    e: Bool?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "hi";
        self.d = 5;
        self.e = null;
    }
}