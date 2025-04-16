contract MixedMany {
    a: Int?;
    b: Int = 0;
    c: String?;
    d: Bool = true;
    e: Bool?;
    f: String = "moo";

    receive() {
        self.a = null;
        self.b = 22;
        self.c = "c";
        self.d = false;
        self.e = null;
        self.f = "f";
    }
}