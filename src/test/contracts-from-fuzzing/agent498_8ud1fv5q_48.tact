contract IntSerializationFailLate2 {
    a: Int as int4;
    init() {
        self.a = 15;  // just at upper bound
        self.a = 8;   // within bound
    }
}