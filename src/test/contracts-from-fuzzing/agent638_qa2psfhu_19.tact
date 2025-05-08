contract OptSerial {
    optSmall: Int? as uint8;

    init() {
        self.optSmall = 42;
    }

    receive() {}
}