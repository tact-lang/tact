contract HeteroSerialization {
    a: Int as uint8;
    b: Int as int32;
    c: Int;
    d: Bool;

    init() {
        self.a = 5;
        self.b = -10;
        self.c = 100;
        self.d = false;
    }
}
