contract SerializeTest {
    small: Int as uint8;
    big: Int as int257;

    init() {
        self.small = 255;
        self.big = -123456789;
    }
}
