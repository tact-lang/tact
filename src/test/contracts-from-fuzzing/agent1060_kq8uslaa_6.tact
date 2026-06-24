struct Inner {
    foo: Int;
    bar: Bool;
}

struct Outer {
    nested: Inner;
    val: Int;
}

contract ParamsNested(
    data: Outer,
    flag: Bool
) {
    // contract uses only parameters, no init()
}