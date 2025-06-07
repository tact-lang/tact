struct MixedOptionals {
    number: Int?;
    flag: Bool?;
    nested: NestedOpt?;
}

struct NestedOpt {
    text: String?;
    num: Int;
}

contract TestOptionalStruct {
    field: MixedOptionals;

    init() {
        self.field = MixedOptionals{
            number: null,
            flag: true,
            nested: NestedOpt{
                text: null,
                num: 123
            }
        };
    }
}
