contract MixedOptionals {
    a: Int?;
    b: Bool;
    c: String?;
    d: Bool?;
    e: Int;

    init() {
        self.a = 42;
        self.b = true;
        self.c = "abc";
        self.d = false;
        self.e = 100;
    }
}