contract SerializeCompose {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint4;
    d: Bool;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = true;
    }
}