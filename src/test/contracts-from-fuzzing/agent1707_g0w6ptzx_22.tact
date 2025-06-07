struct InnerParam {
    foo: Int;
    bar: Bool?;
    baz: String;
}

struct OuterParam {
    one: InnerParam;
    two: InnerParam?;
    flag: Bool;
}

contract ComplexParamContract(
    data: OuterParam
) {}
