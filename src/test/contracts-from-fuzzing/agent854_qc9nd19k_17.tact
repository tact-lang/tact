struct Inner {
    foo: Int as uint16;
    bar: Bool;
}

struct Outer {
    inner: Inner;
    name: String;
}

contract TestContract(
    s: Outer,
    flag: Bool,
    count: Int
) {}
