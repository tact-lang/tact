struct SerialTest {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int32;
    d: Int as int64;
    e: Int as uint256;
}

contract SerializationStress {
    s: SerialTest;
    init() {
        self.s = SerialTest{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5
        };
    }
}

contract Call {
    receive() {
        let dummy: SerializationStress? = null;
    }
}