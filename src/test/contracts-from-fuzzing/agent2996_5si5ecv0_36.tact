struct InconsistentSerial {
    a: Int as uint8;
    b: Int;
    c: Int as uint8;
}

contract SerialEdge {
    data: InconsistentSerial;

    init() {
        self.data = InconsistentSerial{
            a:255,
            b:256,    // exceeds uint8 serialization
            c:255      // ok
        };
    }
}