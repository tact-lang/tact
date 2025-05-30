struct OptionalBoolInt {
    b: Bool?;
    i: Int?;
}

contract TupleOptionalStructs {
    t1: OptionalBoolInt;
    t2: OptionalBoolInt;

    init() {
        self.t1 = OptionalBoolInt{b: null, i: null};
        self.t2 = OptionalBoolInt{b: null, i: null};
    }
}
