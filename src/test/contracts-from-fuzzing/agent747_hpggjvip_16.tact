contract SerializedOrder {
    a: Int as uint8;
    b: Int as int16;
    c: Bool;
    d: String;
    e: Int as uint32;

    init() {
        self.a = 255;
        self.b = -32768;
        self.c = true;
        self.d = "order";
        self.e = 123456;
    }
}