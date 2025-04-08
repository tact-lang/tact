struct DeepNestedOpt {
    s: String?;
}

struct OuterOpt {
    nested: DeepNestedOpt?;
}

contract NullNestedOpt {
    val: OuterOpt;
    init() {
        self.val = OuterOpt{ nested: null };
    }
}