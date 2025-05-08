contract MixedPersists {
    a: Int = 1;
    b: Bool? = null;
    c: String;
    d: Int?;
    e: Bool;
    f: String? = "hello";

    init() {
        self.a = 2;
        self.b = true;
        self.c = "abc";
        self.d = 123;
        self.e = false;
        self.f = null;
    }
}