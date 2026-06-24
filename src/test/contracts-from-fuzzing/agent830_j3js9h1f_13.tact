struct OptionalSerialize {
    maybeU8: Int? as uint8;
    maybeS8: Int? as int8;
}

contract TestOptionalSerialize {
    data: OptionalSerialize;

    init() {
        self.data = OptionalSerialize{
            maybeU8: 42,
            maybeS8: -42
        };
    }
}