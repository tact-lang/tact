// Testing contract parameter syntax with optional and nested struct in param
struct ParamStruct {
    foo: Int;
    bar: Bool?;
}

contract ParamTest(
    a: Int,
    b: Int?,
    s: ParamStruct?
) {}
