contract WeirdWidths {
    a: Int as int3;
    b: Int as uint1;
    c: Int as uint251;

    init() {
        self.a = -4;    // min for int3 (valid)
        self.b = 1;     // max for uint1 (valid)
        self.c = pow(2, 251) - 1;  // max uint251 (should be valid)
    }
}
