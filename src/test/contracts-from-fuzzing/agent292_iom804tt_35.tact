contract IntSerialize {
    a: Int as int128;
    b: Int as uint7;

    init() {
        self.a = -123456789;
        self.b = 127;
    }
}