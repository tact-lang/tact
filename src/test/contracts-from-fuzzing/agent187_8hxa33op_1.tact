struct NestedOpt {
    val1: Int?;
    val2: Bool?;
    val3: String?;
}

contract TestDeepOptional {
    nested: NestedOpt;

    init() {
        self.nested = NestedOpt{
            val1: null,
            val2: true,
            val3: "test",
        };
    }
}
