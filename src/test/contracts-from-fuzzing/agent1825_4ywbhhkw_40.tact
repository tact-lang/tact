struct Packed {
    n1: Int as uint4;
    n2: Int as uint8;
    n3: Int as uint16;
}

contract BitSerial {
    v: Packed;
    init() {
        self.v = Packed{n1:15,n2:255,n3:65535};
    }
}
