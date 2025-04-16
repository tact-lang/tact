contract MixSerialized {
    a: Int as uint32;
    b: Int as int8;
    c: Bool;
    d: String;

    init() {
        self.a = 50000;
        self.b = -5;
        self.c = true;
        self.d = "Hi";
    }
}