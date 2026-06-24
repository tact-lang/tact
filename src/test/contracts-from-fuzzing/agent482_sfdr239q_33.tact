struct Inner {
    foo: Int?;
}

contract StructInnerNull {
    s: Inner = Inner{ foo: null };
}
