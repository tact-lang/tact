struct InnerMost {
    val: Int?;
}

struct Middle {
    inner: InnerMost;
}

contract TripleNest {
    field: Middle;

    init() {
        self.field = Middle{
            inner: InnerMost{
                val: null,
            },
        };
    }
}