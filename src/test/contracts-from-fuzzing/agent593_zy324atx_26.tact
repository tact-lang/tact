// Has some serialization, optionals, booleans, and strings combined
struct Combo {
    a: Int as uint8;
    b: Int?;
    c: Bool;
    d: String?;
}

contract MixFields {
    x: Combo = Combo{ a: 127, b: null, c: true, d: null };

    init() {
        self.x.b = 555;
        self.x.d = "hello world";
        self.x.a = 255; // out of uint8 range deliberately
    }
}