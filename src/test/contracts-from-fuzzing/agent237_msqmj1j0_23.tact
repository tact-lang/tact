struct IntSer {
    small: Int as uint8;
    big: Int;
}

contract IntSizes {
    vals: IntSer;
    init() {
        self.vals = IntSer{small: 255, big: 1000000};
    }
}