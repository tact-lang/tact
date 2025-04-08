// unusual: nested contract parameter structs with default values
struct ParamDefaults {
    a:Int=1;
    b:Bool=false;
}

contract ParamNestedDefaults(
    p: ParamDefaults,
) {}