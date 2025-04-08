struct Inner {
    foo: Int;
}

contract NestedNullableOk {
    maybeInner: Inner?;
    maybeInt: Int?;
}