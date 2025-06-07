struct NestedOpt {
    inner: Int?;
    innerBool: Bool?;
    innerStr: String?;
}

struct OuterOpt {
    nested: NestedOpt?;
    anotherStr: String?;
}

contract OptionalNested {
    store: OuterOpt;
    init() {
        self.store = OuterOpt{
            nested: null,
            anotherStr: null
        };
    }
}