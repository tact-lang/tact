struct MaxSerialization {
    a: Int as int257;
    b: Int as uint256;
}

contract MaxSerializationTest {
    data: MaxSerialization;

    init() {
        self.data = MaxSerialization{
            a: -1,
            b: 1234567890123456789012345678901234567890
        };
    }
}