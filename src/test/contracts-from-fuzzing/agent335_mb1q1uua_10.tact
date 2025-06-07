struct WithSerialization {
    x: Int as uint8;
    y: Int as int64;
    z: Int as uint256;
}

contract SerializationContract {
    data: WithSerialization;

    init() {
        self.data = WithSerialization{
            x: 255,
            y: -10000,
            z: 1000000000000000000000000000
        };
    }
}