struct NestedStr {
    inner: String = "inner";
}

contract Test {
    outerString: String = "outer";
    nested: NestedStr = NestedStr{ inner: "inside" };
    init() {}
}