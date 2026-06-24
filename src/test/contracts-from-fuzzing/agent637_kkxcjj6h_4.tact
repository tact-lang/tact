struct OptionalNested {
    inner: Int?;
    flag: Bool?;
}

contract Test {
    value: OptionalNested = OptionalNested{};
    init() {}
    receive() {}
}