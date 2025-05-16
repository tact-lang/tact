struct OptionalSerial {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract Test {
    os: OptionalSerial;
    init() {
        self.os = OptionalSerial{ a: null, b: 123, c: null };
    }
}