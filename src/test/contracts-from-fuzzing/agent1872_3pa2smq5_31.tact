struct HasDeepOpt {
    s: String;
    opt: String?;
    flag: Bool?;
}

struct WrapOuter {
    nested: HasDeepOpt?;
    count: Int;
}

contract OptStructDeep {
    field: WrapOuter;
    init() {
        self.field = WrapOuter{
            nested: null,
            count: 42,
        };
    }
}