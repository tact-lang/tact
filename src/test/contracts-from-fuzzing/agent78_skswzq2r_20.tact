struct InnerMost {
    val: Int;
}

struct Middle {
    nested: InnerMost;
}

struct OuterMost {
    nested: Middle;
}

contract NestedStructPersistent {
    state: OuterMost;

    init() {
        self.state = OuterMost{
            nested: Middle{
                nested: InnerMost{ val: 42 }
            }
        };
    }
}