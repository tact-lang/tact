struct Inner {
    mandatory: Int;
    maybe: Int?;
}

contract OptOuterBadInner {
    data: Inner?;
}
