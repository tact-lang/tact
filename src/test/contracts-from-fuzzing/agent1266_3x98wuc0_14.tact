struct SerializeFormats {
    small: Int as uint4;
    medium: Int as uint32;
    large: Int as int257;
}

contract SerializedFields {
    data: SerializeFormats;
    init() {
        self.data = SerializeFormats {
            small: 5,
            medium: 100000,
            large: -500
        };
    }
}