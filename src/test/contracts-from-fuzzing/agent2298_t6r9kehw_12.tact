struct MixedSerialization {
    signedVal: Int as int8;
    unsignedVal: Int as uint16;
    coinVal: Int as coins;
}

contract SerializeTest {
    data: MixedSerialization;

    init() {
        self.data = MixedSerialization{
            signedVal: -5,
            unsignedVal: 500,
            coinVal: 1000000000,
        };
    }
}