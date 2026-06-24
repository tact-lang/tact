// Contract parameters with large struct declared that holds primitive and optional fields
struct ParamStruct {
    foo: Int;
    bar: Bool?;
    baz: String;
}

contract ParamTest(
    param: ParamStruct,
) {}
