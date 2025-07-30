struct ExplicitSerialization {
    a: Int as int16;
    b: Int as uint8;
    c: Int as int257;
}

contract SerialTest {
    data: ExplicitSerialization;

    init() {
        self.data = ExplicitSerialization{
            a: -12345,
            b: 250,
            c: 123456789012345678901234567890,
        };
    }
}