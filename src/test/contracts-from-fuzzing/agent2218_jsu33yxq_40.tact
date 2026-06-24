contract OptionalBoolComb {
    a: Bool?;
    b: Bool;
    c: Bool?;
    d: Bool;
    e: Bool?;

    init() {
        self.a = null;
        self.b = true;
        self.c = false;
        self.d = false;
        self.e = null;
    }
}