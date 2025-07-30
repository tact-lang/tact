contract MixedTypes {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String;

    init() {
        self.a = 10;
        self.b = null;
        self.c = false;
        self.d = true;
        self.e = "abc";
        self.f = "def";
    }
}
