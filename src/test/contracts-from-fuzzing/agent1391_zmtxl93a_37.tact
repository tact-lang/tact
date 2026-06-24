struct Inner {
    foo: Int;
}

contract DefaultInnerValue {
    i: Inner = Inner{ foo:42 };
    j: Int = 123;
}