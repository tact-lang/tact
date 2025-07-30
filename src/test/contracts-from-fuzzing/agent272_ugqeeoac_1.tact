struct InnerNested {
    val1: Int;
    val2: Bool?;
}

struct OuterNested {
    nested: InnerNested;
    val3: String;
}

contract NestedStructPersist {
    sfield: OuterNested;

    init() {
        self.sfield = OuterNested{
            nested: InnerNested{
                val1: 7,
                val2: true,
            },
            val3: "test"
        };
    }
}