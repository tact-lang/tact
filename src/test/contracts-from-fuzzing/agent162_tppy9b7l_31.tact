struct InnerS {
    s: String;
}

contract OptionalNestedString2 {
    nested: InnerS?;
    init() {
        self.nested = InnerS{ s: "xx" };
    }
}