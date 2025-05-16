// Test different combinations of optional and serialization
contract MixOptionalSerialization {
    a: Int?; // optional
    b: Int as int64;
    c: Int?; // optional
    d: Int as uint32;

    init() {
        self.a = null;
        self.b = 42;
        self.c = null;
        self.d = 99;
    }
}