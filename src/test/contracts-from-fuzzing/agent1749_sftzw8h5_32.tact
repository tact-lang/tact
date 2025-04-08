contract AnnotatedSerialization {
    one: Int as uint4;
    two: Int as int8;
    three: Int as uint32;
    four: Int as int64;

    init() {
        self.one = 5;
        self.two = 10;
        self.three = 1000;
        self.four = -123456789;
    }
}