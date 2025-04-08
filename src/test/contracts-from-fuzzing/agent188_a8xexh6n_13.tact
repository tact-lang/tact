contract LayeredSerializeTest {
    tiny: Int as int1;
    small: Int as int4;
    med: Int as int8;
    big: Int as int64;

    init() {
        self.tiny = 1;
        self.small = 4;
        self.med = 8;
        self.big = 64;
    }
}