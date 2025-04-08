struct NestedInnerOptional {
    x: Int;
    y: Bool?;
}

struct OuterWithOptional {
    nested: NestedInnerOptional?;
}

contract OptionalWholeNestedStruct {
    s: OuterWithOptional;

    init() {
        self.s = OuterWithOptional{
            nested: null
        };
    }
}
