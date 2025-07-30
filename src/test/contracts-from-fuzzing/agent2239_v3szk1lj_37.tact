contract MixedSerialization {
    a: Int as uint32;
    b: Bool;
    c: Int? as int64;
    d: Bool?;
    s: String;

    init() {
        self.a = 123;
        self.b = false;
        self.c = null;
        self.d = null;
        self.s = "mix";
    }
}