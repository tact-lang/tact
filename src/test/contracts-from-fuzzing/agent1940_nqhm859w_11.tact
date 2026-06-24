struct InnerMost {
    value: Int;
}

struct Inner {
    nested: InnerMost;
}

struct Top {
    inside: Inner;
}

contract NestedAssignments {
    data: Top;

    init() {
        self.data = Top{
            inside: Inner{
                nested: InnerMost{ value: 42 }
            }
        };
    }
}