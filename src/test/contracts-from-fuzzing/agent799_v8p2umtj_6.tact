struct InnerOpt {
    foo: Int?;
}

struct OuterOpt {
    nestedOpt: InnerOpt?;
}

contract OptionalOfStructOptionalField {
    os: OuterOpt;

    init() {
        self.os = OuterOpt{
            nestedOpt: InnerOpt{foo:42}
        };
    }
}