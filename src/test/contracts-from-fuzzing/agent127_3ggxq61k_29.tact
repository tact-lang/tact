struct OptionalIntsSer {
    a: Int? as uint8;
    b: Int? as int16;
}

contract StructOptionalIntSerialization {
    s: OptionalIntsSer;

    init() {
        self.s = OptionalIntsSer{ a: null, b: null };
    }
}