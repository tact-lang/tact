contract SerializationTest {
    big: Int as int257;
    small: Int as uint8;
    mid: Int as int64;

    init() {
        self.big = 1;
        self.small = 255;
        self.mid = -12345678;
    }
}