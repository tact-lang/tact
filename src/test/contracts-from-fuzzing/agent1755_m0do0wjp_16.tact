struct Sub {
    foo: Int;
}

struct WrapOpt {
    bar: Sub?;
    s: String?;
}

contract ParamTest(
    nested: WrapOpt,
) {}
