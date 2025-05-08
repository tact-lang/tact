struct SerialTest {
    x: Int as uint4;
    y: Int as int4;
    z: Int as uint8;
    w: Int as int8;
}

contract Serialization {
    st: SerialTest;

    init() {
        self.st = SerialTest{
            x: 7,
            y: -4,
            z: 255,
            w: -128,
        };
    }
}