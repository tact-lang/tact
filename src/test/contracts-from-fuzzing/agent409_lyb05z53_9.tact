struct SerialOrder1 {
    x: Int as uint8;
    y: Int as uint256;
    z: Int as int4;
}

contract SerialOrderTest {
    data: SerialOrder1;

    init() {
        self.data = SerialOrder1{
            x: 255,
            y: 1234567890,
            z: -7,
        };
    }
}