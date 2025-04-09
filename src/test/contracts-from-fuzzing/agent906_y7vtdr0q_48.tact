struct OptionalInt {
    x: Int?;
}

contract OptInPersistence {
    data: OptionalInt;

    init() {
        self.data = OptionalInt{
            x: null
        };
    }
}