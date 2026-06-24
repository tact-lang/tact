struct OptionalInner {
    value: Int?;
}

contract ImplicitNullNested {
    data: OptionalInner?;
    init() {}
}