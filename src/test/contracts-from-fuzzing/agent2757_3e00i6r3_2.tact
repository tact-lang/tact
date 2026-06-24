struct NestedInner {
    insideInt: Int;
    insideBool: Bool;
}

struct NestedOuter {
    nested: NestedInner;
    someFlag: Bool;
}

contract DeepNested {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            nested: NestedInner{
                insideInt: 0,
                insideBool: false,
            },
            someFlag: true,
        };
    }
}