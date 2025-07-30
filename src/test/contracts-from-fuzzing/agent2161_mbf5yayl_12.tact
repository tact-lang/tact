// Test contract parameter syntax with nested struct parameter
struct ParamStruct {
    x: Int;
    y: Bool;
}

contract ParamStyle(
    param: ParamStruct,
) {
}