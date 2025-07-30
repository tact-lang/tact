contract SerializeOption {
    a: Int as uint32;
    b: Int? as uint32;
    c: Int as int16;
    d: Int? as int16;

    init() {
        self.a = 1;
        self.b = null;
        self.c = 2;
        self.d = null;
    }
}