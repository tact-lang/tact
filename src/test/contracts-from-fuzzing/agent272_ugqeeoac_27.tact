contract OverlappingFieldOrder {
    f1: Int as uint8;
    f2: Int as int8;
    f3: Int;

    init() {
        self.f1 = 127;
        self.f2 = -128;
        self.f3 = 100000;
    }
}