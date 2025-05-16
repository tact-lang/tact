struct NestedManyOpt {
    s: String?;
    b: Bool?;
    i: Int?;
    a: Address?;
}

struct OuterManyOpt {
    nested: NestedManyOpt?;
    extra: Int?;
}

contract DeeplyOptionedStruct {
    data: OuterManyOpt;

    init() {
        self.data = OuterManyOpt{
            nested:null,
            extra:null
        };
    }
}