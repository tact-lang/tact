contract OrderSerialize {
    a: Int as uint8;
    b: Int;
    c: Bool;
    d: String;

    init() {
        self.a = 255;
        self.b = 999;
        self.c = true;
        self.d = "order";
    }
}