struct InnerOptional {
    data: Int?;
    flag: Bool;
}

struct OuterOptional {
    nestedOpt: InnerOptional?;
    info: Int;
}

contract OptionalCombined {
    field: OuterOptional;

    init() {
        self.field = OuterOptional{
            nestedOpt: null,
            info: 88
        };
    }
}