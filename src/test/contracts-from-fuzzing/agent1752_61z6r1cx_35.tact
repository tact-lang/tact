contract IntMinMaxSerialization {
    a: Int as uint5;
    b: Int as int9;

    init() {
        self.a = 31;   // max for uint5
        self.b = -256; // min for int9
    }
}