struct InnerNested {
    first: Int;
    second: Bool;
}
struct OuterStruct {
    nested: InnerNested;
    optionalField: String?;
}

contract MixedNested {
    combined: OuterStruct;

    init() {
        self.combined = OuterStruct {
            nested: InnerNested{first:15, second:true},
            optionalField: null
        };
    }
}