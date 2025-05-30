struct InnerOpt {
    val: Int?;
}

struct OuterOpt {
    nested: InnerOpt?;
    another: Int;
}

contract NestedOptionalField {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            nested: null,
            another: 5
        };
    }
}