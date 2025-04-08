struct OptionalInts {
    i1: Int?;
    i2: Int?;
}

contract OptionalDefault {
    field: OptionalInts;

    init() {
        self.field = OptionalInts{ i1: null, i2: null };
    }
}