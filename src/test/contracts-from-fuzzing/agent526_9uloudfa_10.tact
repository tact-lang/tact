struct OptionalWithSerialization {
    a: Int? as uint16;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract OptionalSerialTest {
    data: OptionalWithSerialization;

    init() {
        self.data = OptionalWithSerialization{
            a: 17,
            b: null,
            c: myAddress(),
            d: null,
        };
    }

    receive() {}
}