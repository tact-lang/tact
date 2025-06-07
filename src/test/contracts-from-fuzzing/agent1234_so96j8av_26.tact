struct Inner {
    foo: Int as uint8;
    bar: Bool?;
}

contract OptNestedParamTest(
    data: Inner?,
) {}