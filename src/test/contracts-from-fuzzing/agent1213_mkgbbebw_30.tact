struct InnerMost {
    val: Int;
}

struct Inner {
    v1: InnerMost;
    v2: InnerMost;
}

contract DuplicateNestedStructs {
    nested: Inner;

    init() {
        let nm = InnerMost { val: 5 };
        self.nested = Inner { v1: nm, v2: nm };
    }
}