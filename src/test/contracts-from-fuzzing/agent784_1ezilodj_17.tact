struct Inner {
    mandatory: Int;
    maybe: Int?;
}

contract PartiallyAssignedInner {
    data: Inner = Inner{mandatory: 0};
}
