struct HasSerialization {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint256;
}

contract SerializedStorage {
    data: HasSerialization;
    init() {
        self.data = HasSerialization{
            a: 1, b: -2, c: 3
        };
    }
}