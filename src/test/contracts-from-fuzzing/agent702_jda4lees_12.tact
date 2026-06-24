struct DeepLeaf {
    val: Int;
}

struct MiddleLevel {
    leafOpt: DeepLeaf? = null;
    num: Int = 42;
}

contract NestedDefaults {
    nested: MiddleLevel = MiddleLevel{};
    init() {
        // no assignment
    }
}