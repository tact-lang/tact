struct SerializeFormats {
    int8f: Int as int8;
    uint12f: Int as uint12;
    int64f: Int as int64;
    uint256f: Int as uint256;
}

contract TestContract {
    f: SerializeFormats;

    init() {
        self.f = SerializeFormats{
            int8f: -5,
            uint12f: 42,
            int64f: -1000,
            uint256f: 1234567890
        };
    }
}