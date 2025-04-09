// Edge case: many booleans (bit-packing stress test), interleaved with ints
contract BoolFlood {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
    i1: Int;
    b6: Bool;
    b7: Bool;
    i2: Int;
    b8: Bool;
    b9: Bool;
    b10: Bool;

    init() {
        self.b1 = true;
        self.b2 = false;
        self.b3 = true;
        self.b4 = false;
        self.b5 = true;
        self.i1 = 123;
        self.b6 = false;
        self.b7 = true;
        self.i2 = 456;
        self.b8 = false;
        self.b9 = true;
        self.b10 = false;
    }
}