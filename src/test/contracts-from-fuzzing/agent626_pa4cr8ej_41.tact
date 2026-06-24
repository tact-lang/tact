struct OptionalBoolInt {
    a: Bool?;
    b: Int?;
}

contract TestOptBoolInt {
    o: OptionalBoolInt;

    init() {
        self.o = OptionalBoolInt{
            a: null,
            b: null
        };
    }
}