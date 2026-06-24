struct NestedStr {
    s1: String;
    s2: String?;
}

contract TestContract {
    nested: NestedStr;

    init() {
        self.nested = NestedStr{
            s1: "foo",
            s2: null,
        };
    }
}