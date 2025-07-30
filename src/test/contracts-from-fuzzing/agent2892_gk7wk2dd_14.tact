struct OptionalStrStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    foo: Int;
    bar: Bool;
}

contract OptStructNull {
    st: OptionalStrStruct;
    init() {
        self.st = OptionalStrStruct{ inner: null };
    }
}