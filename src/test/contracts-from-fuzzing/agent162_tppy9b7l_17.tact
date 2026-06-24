struct InnerDeep {
    b: Bool;
    s: String;
}

struct MiddleDeep {
    nested: InnerDeep;
    opt: Int?;
}

contract DeepMix {
    mixed: MiddleDeep;
    init() {
        self.mixed = MiddleDeep{
            nested: InnerDeep{
                b: true,
                s: "test",
            },
            opt: 11,
        };
    }
}