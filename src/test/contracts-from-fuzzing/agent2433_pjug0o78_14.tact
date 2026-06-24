contract MixedSerializedFields {
    a: Int as int64;
    b: Int as uint7;
    c: Int as coins;
    d: Int;
    e: Bool;
    f: String;

    init() {
        self.a = 123;
        self.b = 5;
        self.c = ton("1");
        self.d = 456;
        self.e = true;
        self.f = "hello";
    }
}