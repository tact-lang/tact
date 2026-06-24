struct NestedInner {
    val1: Int;
    val2: String;
    optVal1: Bool?;
}

struct NestedOuter {
    inner: NestedInner;
    val3: String;
    optVal2: Int?;
}

contract TestContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                val1: 1,
                val2: "test",
                optVal1: null,
            },
            val3: "outer",
            optVal2: null,
        };
    }
}