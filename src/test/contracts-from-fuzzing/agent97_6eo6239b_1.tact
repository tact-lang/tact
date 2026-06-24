struct NestedInner {
    value: Int;
}

struct NestedOuter {
    nested: NestedInner;
    flag: Bool;
}

contract TestStorage {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            nested: NestedInner{ value: 42 },
            flag: true,
        };
    }
}