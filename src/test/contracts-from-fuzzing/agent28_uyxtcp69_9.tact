struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    nested: Inner;
    c: String;
}

contract ParamsContract(
    param: Outer,
) {}