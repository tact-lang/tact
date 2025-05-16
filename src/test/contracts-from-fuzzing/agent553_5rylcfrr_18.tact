struct NestedStrings {
    a: String;
    b: String?;
}

struct ContainsNested {
    inner: NestedStrings;
}

contract StringNested {
    data: ContainsNested;

    init() {
        self.data = ContainsNested{
            inner: NestedStrings{ a: "foo", b: null }
        };
    }
}