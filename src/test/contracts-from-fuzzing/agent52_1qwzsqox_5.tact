struct SerializationEdge {
    i64: Int as int64;
    u8: Int as uint8;
    bigSigned: Int as int257;
    tinyUnsigned: Int as uint1;
}

contract TestContract {
    data: SerializationEdge;

    init() {
        self.data = SerializationEdge{
            i64: 1234567890,
            u8: 255,
            bigSigned: 0,
            tinyUnsigned: 1
        };
    }
}
