struct NestedOpt {
    val1: Int?;
    val2: Bool?;
    val3: Slice?;
}

contract Test {
    nested: NestedOpt;

    init() {
        self.nested = NestedOpt{
            val1: null,
            val2: null,
            val3: null,
        };
    }
}
