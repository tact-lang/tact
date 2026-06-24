contract InvalidFieldOrder {
    one: Int as uint16;
    two: Int as uint64;
    init() {
        self.one = 1;
        self.two = 2;
    }
    receive() {}
}