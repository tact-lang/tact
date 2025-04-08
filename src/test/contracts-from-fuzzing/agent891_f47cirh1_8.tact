struct InnerMost {
    val: Int;
}

struct Mid {
    opt: InnerMost?;
}

struct OuterMost {
    nested: Mid;
}

contract NestedNullsTest {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            nested: Mid{
                opt: null
            }
        };
    }
}
