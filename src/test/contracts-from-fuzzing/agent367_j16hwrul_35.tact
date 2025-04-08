// test struct in params with nested optional
struct N {
    x: Int;
    y: Bool?;
}

struct OuterParam {
    inner: N?;
    z: String;
}

contract ComplexParam(
    payload: OuterParam
) {
    receive() {}
}