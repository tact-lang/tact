// Contract with persistent fields with custom serialization mix
contract MixedSerialize {
    i1: Int as uint4;
    i2: Int as int64;
    i3: Int as coins;
    i4: Int as int8;
    b: Bool;
    s: String;

    init() {
        self.i1 = 7;
        self.i2 = 12345678;
        self.i3 = 1000000000;
        self.i4 = -5;
        self.b = true;
        self.s = "serialize";
    }
}