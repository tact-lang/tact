struct InnerNested {
    val1: Int;
    flag: Bool;
}

struct OuterNested {
    inner: InnerNested;
    count: Int;
}

contract NestedStructContract {
    data: OuterNested;

    init() {
        self.data = OuterNested{
            inner: InnerNested{
                val1: 7,
                flag: true,
            },
            count: 42,
        };
    }
}