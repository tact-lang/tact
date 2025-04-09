struct MixOptSerialize {
    small: Int as uint8;
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeStr: String?;
    bigger: Int as int32;
}

contract MixOptSerializePersist {
    store: MixOptSerialize;

    init() {
        self.store = MixOptSerialize{
            small: 255,
            maybeInt: null,
            maybeBool: true,
            maybeStr: null,
            bigger: -12345,
        };
    }
}
