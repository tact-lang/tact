struct OptionalStruct1 {
    foo: Int;
}

struct OptionalStruct2 {
    bar: Int;
}

contract MultipleOptionalStructs {
    a: OptionalStruct1?;
    b: OptionalStruct2?;
    init() {
        self.a = null;
        self.b = null;
    }
}
