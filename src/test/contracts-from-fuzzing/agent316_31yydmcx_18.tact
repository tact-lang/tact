struct Inner {
    foo: Int;
}

struct Outer {
    inner: Inner?;
    flag: Bool;
}

contract ParamOpt(
    data: Outer?,
    number: Int?
) {
    receive() {}
}