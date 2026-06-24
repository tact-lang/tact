contract SerializationFormats {
    big: Int as int64;
    small: Int as uint4;
    mid: Int as uint32;
    optMid: Int? as uint32;

    init() {
        self.big = 42;
        self.small = 5;
        self.mid = 12345;
        self.optMid = null;
    }
}