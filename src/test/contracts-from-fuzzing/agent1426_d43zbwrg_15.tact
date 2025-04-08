struct OptionalInt {
    value: Int?;
}

contract WriteNull {
    stored: OptionalInt;

    init() {
        self.stored = OptionalInt{
            value: null
        };
    }
}