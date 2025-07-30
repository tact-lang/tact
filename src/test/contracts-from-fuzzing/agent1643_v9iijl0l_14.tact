struct InnerLevel {
    val1: Int;
}

struct OuterLevel {
    inner: InnerLevel;
}

struct TopLevel {
    outer: OuterLevel;
}

contract NestedStructMultiLevel {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            outer: OuterLevel{
                inner: InnerLevel{
                    val1: 42
                }
            }
        };
    }
}
