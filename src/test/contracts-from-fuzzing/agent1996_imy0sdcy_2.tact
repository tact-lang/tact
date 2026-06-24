struct NestedInner {
    val: Int;
    flag: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    num: Int;
}

contract PersistenceNested {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                val: 10,
                flag: true,
            },
            num: 42,
        };
    }
}