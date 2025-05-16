contract IntAsSerialize {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;

    init() {
        self.a = 1;
        self.b = -4;
        self.c = 100;
    }
}
