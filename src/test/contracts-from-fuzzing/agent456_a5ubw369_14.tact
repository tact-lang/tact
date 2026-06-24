struct Inner {
    v: Int;
}

struct Wrapper {
    optionalStruct: Inner?;
    optionalInt: Int?;
}

contract OptionalMix {
    field: Wrapper;

    init() {
        self.field = Wrapper {
            optionalStruct: null,
            optionalInt: null
        };
    }
}