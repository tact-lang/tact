struct NestedStrings {
    a: String;
    b: String?;
}

contract StringNested {
    data: NestedStrings;

    init() {
        self.data = NestedStrings{
            a: "foo",
            b: null
        };
    }
}