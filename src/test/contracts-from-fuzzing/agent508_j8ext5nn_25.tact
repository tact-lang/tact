contract SerializeTest {
    small: Int as uint8;
    big: Int;

    init() {
        self.small = 256; // outside of uint8
        self.big = self.small * 1000;
    }
}