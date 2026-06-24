struct Inner {
    foo: Int;
    bar: Bool;
}

contract FieldOfStructWithDefault {
    v: Inner = Inner{foo: 42, bar: true};
}