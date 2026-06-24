struct DeepOpt {
    a: Int?;
    b: Bool?;
    c: InnerOpt?;
}

struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

contract OptionalDeep {
    field: DeepOpt;

    init() {
        self.field = DeepOpt{
            a: null,
            b: true,
            c: InnerOpt{
                foo: 42,
                bar: null,
            },
        };
    }
}