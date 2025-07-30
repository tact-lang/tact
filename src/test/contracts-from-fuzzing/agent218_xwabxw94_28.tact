struct EdgeInts {
    smallNeg: Int as int4;
    maxU8: Int as uint8;
}

contract EdgeCaseSerialization {
    e: EdgeInts;

    init() {
        self.e = EdgeInts{ smallNeg: -8, maxU8: 255 };
    }
}