struct InnerParam {
    foo: Int?;
    bar: Bool;
}

struct Params {
    name: String;
    inner: InnerParam;
}

contract ParamContract(
    params: Params,
) {}