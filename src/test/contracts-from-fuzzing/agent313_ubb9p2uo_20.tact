struct OddSerial {
    x: Int as uint7;
    y: Int as int27;
    z: Int as uint1;
}

contract BitWidthTest {
    test: OddSerial;

    init() {
        self.test = OddSerial{ x: 5, y: -12, z: 1 };
    }
}