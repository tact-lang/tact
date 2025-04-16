contract NegativeUIntOptionalSerialization {
    a: Int? as uint8;

    init() {
        self.a = -10;
    }
}