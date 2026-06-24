contract SerializationWidths {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint4;
    d: Bool;
    e: String;

    init() {
        self.a = 255;
        self.b = -32768;
        self.c = 15;
        self.d = true;
        self.e = "serialization";
    }
}