// contract params with many optional nested struct params
struct X {
    a: Int?;
    b: Bool?;
}

contract ParamsManyOpt(
    f1: X?,
    f2: X?,
    f3: X?
) {}