struct OptionalSerialization {
    optInt: Int? as uint8;
    normalInt: Int as int16;
}

contract TestContract {
    data: OptionalSerialization;

    init() {
        self.data = OptionalSerialization{
            optInt: 12,
            normalInt: -56,
        };
    }
}