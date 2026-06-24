struct OuterSerial {
    d: Int as uint64;
    e: Int as int8;
}

contract SerialOuter {
    outer: OuterSerial;

    init() {
        self.outer = OuterSerial{d:5,e:6};
    }
}