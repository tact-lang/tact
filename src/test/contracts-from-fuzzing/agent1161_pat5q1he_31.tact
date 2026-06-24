struct InnerMost {
    n: Int;
}

struct MiddleMost {
    s: InnerMost;
}

struct OuterMost {
    m: MiddleMost?;
}

contract NestedOptionalStructs {
    data: OuterMost;

    init() {
        self.data = OuterMost{ m: null };
    }
}