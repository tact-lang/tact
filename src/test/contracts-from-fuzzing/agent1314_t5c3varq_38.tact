contract IntSerialization {
    small: Int as uint8;
    med: Int as int32;
    big: Int;

    init() {
        self.small=7;
        self.med=-123456;
        self.big=100000000000;
    }
}