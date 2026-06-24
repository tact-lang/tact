struct OptionalStruct {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptStructHolder {
    opt: OptionalStruct = OptionalStruct{
        foo: null,
        bar: null,
        baz: null
    };
}