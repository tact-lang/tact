contract UnserializedInts {
    big: Int;
    small: Int as uint4;

    init() {
        self.big = 123456789;
        self.small = 5;
    }
}