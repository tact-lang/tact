struct OptionalBoolInt {
    b: Bool?;
    n: Int?;
}

contract OptionalBoolIntTest {
    rec: OptionalBoolInt;

    init() {
        self.rec = OptionalBoolInt{
            b: null,
            n: null
        };
    }
}
