contract OrderingSerialize {
    a: Int as uint8;
    b: Int as int16;
    c: Int;
    d: String;
    e: Bool;

    init() {
        self.a = 200;
        self.b = -200;
        self.c = 1000000;
        self.d = "order";
        self.e = true;
    }
}