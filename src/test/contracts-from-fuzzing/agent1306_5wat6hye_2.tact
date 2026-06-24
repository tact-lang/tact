struct NestedInner {
    flag: Bool;
    description: String?;
}

struct NestedOuter {
    id: Int;
    inner: NestedInner;
}

contract DeepStorage {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            id: 7,
            inner: NestedInner{
                flag: true,
                description: null
            }
        };
    }
}