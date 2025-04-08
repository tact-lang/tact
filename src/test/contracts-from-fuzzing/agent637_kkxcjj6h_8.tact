struct NestedStrings {
    a: String = "A";
    b: String = "B";
}

contract Test {
    texts: NestedStrings = NestedStrings{};
    init() {}
    receive() {}
}