struct SerializeFormats {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
}

contract SerializationVariants {
    data: SerializeFormats;

    init() {
        self.data = SerializeFormats{ a:1, b:-2, c: 3 };
    }
}