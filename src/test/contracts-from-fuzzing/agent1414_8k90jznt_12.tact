struct Inner {
    a: Int;
    b: String;
}

struct Outer {
    inner: Inner;
    num: Int;
}

contract StructParamContract(
    config: Outer
) {}