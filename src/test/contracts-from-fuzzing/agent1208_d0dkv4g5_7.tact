struct InnerOpt {
    foo: Int?;
    label: String?;
}

struct OuterOpt {
    nested: InnerOpt?;
    active: Bool;
}

contract OptionalNestedStruct {
    data: OuterOpt?;

    init() {
        self.data = OuterOpt{
            nested: InnerOpt{ foo: null, label: "x" },
            active: true
        };
    }
}