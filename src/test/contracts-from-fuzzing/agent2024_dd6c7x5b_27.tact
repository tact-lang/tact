struct NestedInner {
    i: Int;
    flag: Bool?;
}

struct OuterMost {
    nested: NestedInner?;
}

contract NestedNulls {
    val: OuterMost;

    init() {
        self.val = OuterMost{
            nested: null
        };
    }
}