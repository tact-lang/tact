contract OptSerialize {
    a: Int? as uint32;
    b: Int? as int64;
    c: Bool?;

    init() {
        self.a = 50;
        self.b = null;
        self.c = true;
    }
}