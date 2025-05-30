struct PosInt {
    n: Int as uint8;
}

contract SerializationMaxLimits {
    data: PosInt;

    init() {
        self.data = PosInt { n: 255 };
    }
}
