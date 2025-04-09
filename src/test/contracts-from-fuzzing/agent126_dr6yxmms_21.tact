contract OptionalSerialization {
    optu8: Int? as uint8;
    opti8: Int? as int8;

    init() {
        self.optu8 = 200;
        self.opti8 = -100;
    }
}