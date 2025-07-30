struct InnerOpt {
    number: Int?;
    boolean: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract NestedOptionalField {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: InnerOpt{
                number: null,
                boolean: true,
            }
        };
    }
}
