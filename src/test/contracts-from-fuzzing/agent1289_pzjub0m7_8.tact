struct MixedSerialization {
    small: Int as uint8;
    large: Int as int257;
    mid: Int as int32;
    coinAmount: Int as coins;
}

contract MixedSerializationTest {
    storage: MixedSerialization;

    init() {
        self.storage = MixedSerialization{
            small: 5,
            large: 1000000,
            mid: -1234,
            coinAmount: 5000000,
        };
    }
}