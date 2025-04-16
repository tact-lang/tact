struct SerializeOpts {
    narrow: Int as uint4;
    wider: Int as int128;
    biggest: Int as int257;
}

contract SerializationOpts {
    data: SerializeOpts;

    init() {
        self.data = SerializeOpts{
            narrow: 7,
            wider: 12345678,
            biggest: 456789012345678901234567890
        };
    }
}