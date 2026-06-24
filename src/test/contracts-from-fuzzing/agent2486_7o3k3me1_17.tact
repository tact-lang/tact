// contract params with complex composite param

struct Params {
    a: Int;
    b: String;
    c: Bool?;
}

contract CompositeParam(
    data: Params,
    flag: Bool,
) {}