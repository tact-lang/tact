contract OverflowsInOrder {
    a: Int as uint8;
    b: Int as int4;

    init() {
        self.a = 300;
        self.b = 15;
    }
}
