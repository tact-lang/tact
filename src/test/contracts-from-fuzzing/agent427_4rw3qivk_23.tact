struct NestedWithStrings {
    foo: String;
    nested: InnerLayer;
}

struct InnerLayer {
    bar: Int;
    baz: String;
}

contract StringNest {
    value: NestedWithStrings;

    init() {
        self.value = NestedWithStrings{
            foo: "hello",
            nested: InnerLayer{
                bar: 10,
                baz: "world"
            }
        };
    }
}