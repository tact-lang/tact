struct OptionalInSerial {
    a: Int as int64;
    b: Int?;
}

contract OptSerial {
    d: OptionalInSerial = OptionalInSerial{ a: 1, b: null };

    receive() {
        self.d = self.d;
    }
}