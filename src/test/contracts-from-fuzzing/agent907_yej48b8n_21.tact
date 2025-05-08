struct WithVariousSerializations {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int32;
    d: Int as int64;
    e: Int as uint128;
    f: Int as int257;
}

contract SerializationVarietyTest {
    field: WithVariousSerializations;
    init() {
        self.field = WithVariousSerializations{
            a: 1, b:2, c:3, d:4, e:5, f:6
        };
    }
}