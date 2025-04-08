contract SerializationTest {
    one: Int as uint8;
    two: Int as int16;
    three: Int as uint32;
    four: Int as int64;
    posCoins: Int as coins;

    init() {
        self.one = 1;
        self.two = -2;
        self.three = 3;
        self.four = -4;
        self.posCoins = 1000000;
    }
}