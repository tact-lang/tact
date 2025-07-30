struct OptionalDeep {
    foo: Int?;
    bar: Int?;
    baz: Int?;
}

contract OptionalFullDefault {
    val: OptionalDeep = OptionalDeep{
        foo: null,
        bar: null,
        baz: null
    };
}