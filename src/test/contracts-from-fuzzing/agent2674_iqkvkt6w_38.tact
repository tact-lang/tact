// contract with optional struct parameter
struct ParamsOpt {
    a: Int;
    b: Bool;
}

contract HasOptionalParam(
    p1: ParamsOpt?,
) {
}