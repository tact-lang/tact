struct SerialTest {
    x: Int as int64;
    y: Int as uint8;
    z: Int;
}

contract SerializeFields {
    data: SerialTest;
    init() {
        self.data = SerialTest{
            x: -100,
            y: 255,
            z: 123456,
        };
    }
}