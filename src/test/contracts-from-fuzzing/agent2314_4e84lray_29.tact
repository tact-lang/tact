struct NestedInnerMost {
    val: Int;
}

struct NestedMid {
    inner: NestedInnerMost;
}

struct NestedOuterMost {
    mid: NestedMid;
}

contract TestLongNestedChain {
    chain: NestedOuterMost;

    init() {
        self.chain = NestedOuterMost{
            mid: NestedMid{
                inner: NestedInnerMost{
                    val: 12345
                }
            }
        };
    }
}