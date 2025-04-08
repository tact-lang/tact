struct Param {
    x: Int as uint8;
    y: Int as int64;
    z: Int as uint256;
}

contract SerializationTest {
    field: Param;

    init() {
        self.field = Param{ x: 5, y: -1000, z: 12345678901234567890 };
    }
}
