contract DefaultEdge {
    a: Int = -1;
    b: Int as uint8 = 255;
    c: Int as int8 = -128;
    d: Bool = true;
    e: String = "";

    init() {
        self.a = 0;
        self.b = 0;
        self.c = 0;
        self.d = false;
        self.e = "x";
    }
}
