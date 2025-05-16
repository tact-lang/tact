struct Padded {
    a: Int as uint8;
    b: Int;
}

contract SerializationSizeTest {
    data: Padded;

    init() {
        self.data = Padded{
            a: 255,
            b: 1000
        };
    }
}
