contract ManyFieldsString {
    a: String;
    b: String;
    c: String?;
    d: String?;
    e: String;
    f: String?;

    init() {
        self.a = "a";
        self.b = "b";
        self.c = null;
        self.d = null;
        self.e = "e";
        self.f = null;
    }
}
