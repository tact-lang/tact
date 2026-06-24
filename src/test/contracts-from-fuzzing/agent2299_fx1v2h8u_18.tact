struct InnerMost { val: Int; }
struct Inner { mid: InnerMost; }

contract NestedZeroInit {
    nested: Inner = Inner{
        mid: InnerMost{
            val: 0
        }
    };
}