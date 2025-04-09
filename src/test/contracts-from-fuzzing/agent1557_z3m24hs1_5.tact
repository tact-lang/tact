struct OptionalNested {
    optInner: Bool?;
}

struct OuterStruct {
    nestedOpt: OptionalNested?;
}

contract OptionalNestedStructs {
    storage: OuterStruct;

    init() {
        self.storage = OuterStruct{
            nestedOpt: OptionalNested{ optInner: null }
        };
    }
}