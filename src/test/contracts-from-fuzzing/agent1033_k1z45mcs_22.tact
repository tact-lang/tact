struct InnerMost {
    val: Int;
}

struct Inner {
    val: InnerMost;
}

struct Middle {
    val: Inner;
}

struct OuterMost {
    val: Middle;
}

contract NestedAssignment {
    state: OuterMost;

    init() {
        self.state = OuterMost{
            val: Middle{
                val: Inner{
                    val: InnerMost{ val: 42 }
                }
            }
        };
    }
}