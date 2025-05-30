struct SerializeInt {
    big: Int as int256;
    small: Int as uint8;
    med: Int as int32;
}

contract SerializeTest {
    data: SerializeInt;
    init() {
        self.data = SerializeInt{
            big: 123,
            small: 255,
            med: -12345,
        };
    }
}