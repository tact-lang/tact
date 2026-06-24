contract WeirdSerialization {
    a: Int as int7;
    b: Int as uint9;
    init() {
        self.a = -64;
        self.b = 256;
    }
}