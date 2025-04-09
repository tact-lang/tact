struct OptionalNested {
    a: Int?;
    b: String?;
}

struct TopStruct {
    innerOpt: OptionalNested?;
    flag: Bool;
}

contract OptionDeep {
    field: TopStruct = TopStruct{
        innerOpt: null,
        flag: false
    };

    init() {
        self.field = TopStruct{
            innerOpt: OptionalNested{a: null, b: "deep"},
            flag: true
        };
    }
}
