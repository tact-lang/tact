struct InnerOpt {
    intVal: Int?;
    boolVal: Bool?;
}

struct OuterOpt {
    nested: InnerOpt?;
    s: String?;
}

contract OptionalNestedOpts {
    field: OuterOpt;

    init() {
        self.field = OuterOpt{
            nested: null,
            s: null
        };
    }
}
