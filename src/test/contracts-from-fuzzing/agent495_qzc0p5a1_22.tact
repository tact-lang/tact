struct SerializeHints {
    signedVal: Int as int64;
    unsignedVal: Int as uint64;
    smallVal: Int as uint8;
}

contract SerializeHintsContract {
    data: SerializeHints;

    init() {
        self.data = SerializeHints{
            signedVal: -123456789,
            unsignedVal: 123456789,
            smallVal: 255
        };
    }
}