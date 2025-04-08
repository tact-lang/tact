contract MixedSerialized {
    a: Int as int8;
    b: Int as uint64;
    c: Bool;
    d: String;
    e: Int;
    
    init() {
        self.a = -5;
        self.b = 1000;
        self.c = true;
        self.d = "foo";
        self.e = 123456789;
    }
}