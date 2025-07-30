struct StructWithOptionalStruct {
    foo: Int;
    nestedOpt: SomeStruct?;
}

struct SomeStruct {
    bar: Int;
    baz: Bool;
}

contract OptionalStructRef {
    data: StructWithOptionalStruct;

    init() {
        self.data = StructWithOptionalStruct{
            foo: 10,
            nestedOpt: null
        };
    }
}