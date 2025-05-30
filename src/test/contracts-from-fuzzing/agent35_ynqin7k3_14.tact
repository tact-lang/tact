struct InnerMost {
    val: Int;
}

struct Inner {
    nested: InnerMost;
}

struct OuterOpt {
    nested: Inner?;
    number: Int;
}

contract NestedOptionalStructs {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            nested: null,
            number: 77
        };
    }
}