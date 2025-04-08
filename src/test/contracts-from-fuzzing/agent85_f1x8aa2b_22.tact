contract OverlappingSerialization {
    a: Int as uint8;
    b: Int as uint16;

    init() {
        self.a = 1;
        self.b = 300;
    }

    receive() {}
}