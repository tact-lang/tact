struct NestedInner {
    flag: Bool;
    count: Int;
}

struct NestedOuter {
    id: Int;
    nested: NestedInner;
}

contract DeepFields {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            id: 10,
            nested: NestedInner{
                flag: true,
                count: 42
            }
        };
    }
}