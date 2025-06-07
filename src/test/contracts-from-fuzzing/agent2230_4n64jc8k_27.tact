// Optional complex struct in contract params
struct ComplexOptional {
    x: Int;
    y: Bool?;
    z: String;
}

contract ParamOpt(
    opt: ComplexOptional?
) {}
