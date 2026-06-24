struct SerializeMix {
    a: Int as uint8;
    b: Int?;
}

contract SerializeMixContract {
    data: SerializeMix;

    init() {
        self.data = SerializeMix{
            a: 255,
            b: null
        };
    }
}
