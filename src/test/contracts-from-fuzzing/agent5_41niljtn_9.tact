struct StructX {
    a: Int;
}

struct StructY {
    b: Int;
    nested: StructX;
}

contract DeeplyNestedOpt {
    nestedOpt: StructY?;

    init() {
        self.nestedOpt = StructY{
            b: 123,
            nested: StructX{a: 456}
        };
    }
}