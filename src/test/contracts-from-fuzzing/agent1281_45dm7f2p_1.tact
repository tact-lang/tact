struct NestedInner {
    val1: Int;
    val2: Int?;
}

struct NestedOuter {
    inner: NestedInner;
    flag: Bool;
}

contract DeepNestedStorage {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                val1: 123,
                val2: null,
            },
            flag: true,
        };
    }
}