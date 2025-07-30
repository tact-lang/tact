struct OptionalInner {
    optInt: Int?;
    optBool: Bool?;
}

struct OuterOpt {
    nested: OptionalInner?;
    val: Int;
}

contract NestedOptional {
    data: OuterOpt = OuterOpt{
        nested: null,
        val: 5
    };
    init() {
        self.data = OuterOpt{
            nested: OptionalInner{
                optInt: 10,
                optBool: true
            },
            val: 42
        };
    }
}