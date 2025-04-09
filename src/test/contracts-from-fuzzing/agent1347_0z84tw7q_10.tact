struct ComplexParams {
    foo: Int;
    bar: Bool;
    nest: Nested;
}

struct Nested {
    baz: Int as uint32;
    qux: Bool?;
}

contract ParamContract(
    param: ComplexParams,
) {}