struct OptionalSerial {
    x: Int? as uint32;
    y: Bool?;
}

contract OptionalSerialTest {
    data: OptionalSerial;

    init() {
        self.data = OptionalSerial{
            x: null,
            y: null,
        };
    }

    receive() {}
}
