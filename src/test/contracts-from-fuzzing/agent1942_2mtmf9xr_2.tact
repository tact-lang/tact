struct NestedInner {
    innerField1: Int;
    innerField2: Bool;
}

struct NestedOuter {
    outerField1: String;
    nested: NestedInner;
}

contract WithNested {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            outerField1: "hello",
            nested: NestedInner{
                innerField1: 42,
                innerField2: true,
            }
        };
    }
}