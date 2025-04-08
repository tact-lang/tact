struct OptionalStruct {
    inner: DataStruct?;
}

struct DataStruct {
    foo: Int;
}

contract NullInnerStruct {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{ inner: null };
    }
}