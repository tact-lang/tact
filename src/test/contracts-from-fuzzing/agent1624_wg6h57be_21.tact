struct NestedManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

struct TopHasMandatoryNested {
    nested: NestedManyOptionals;
}

contract NestedOptionalsInMandatory {
    data: TopHasMandatoryNested;

    init() {
        self.data = TopHasMandatoryNested{
            nested: NestedManyOptionals{
                a: null,
                b: null,
                c: null,
                d: null,
            }
        };
    }
}