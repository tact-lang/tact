struct OptionalBoolInt {
    a: Bool?;
    b: Int?;
}

contract Test {
    data: OptionalBoolInt;

    init() {
        self.data = OptionalBoolInt{
            a: true,
            b: null
        };
    }
}