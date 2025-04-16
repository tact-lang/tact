struct OptionalBoolInt {
    a: Bool?;
    b: Int?;
}

contract OptionalBoolIntTest {
    data: OptionalBoolInt;

    init() {
        self.data = OptionalBoolInt{
            a: null,
            b: null
        };
    }
}