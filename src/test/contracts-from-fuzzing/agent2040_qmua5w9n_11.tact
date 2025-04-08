struct InnerOpt {
    flag: Bool?;
    text: String;
}

struct OuterOpt {
    nested: InnerOpt?;
    another: Int;
}

contract NullableInnerStruct {
    field: OuterOpt;

    init() {
        self.field = OuterOpt{
            nested: null,
            another: 7
        };
    }
}
