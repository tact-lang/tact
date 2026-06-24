struct DeepOptionals {
    a: Int?;
    b: MidOpt?;
}

struct MidOpt {
    c: Int?;
    d: InnerOpt?;
}

struct InnerOpt {
    e: Int?;
}

contract MultiNulls {
    state: DeepOptionals;

    init() {
        self.state = DeepOptionals{
            a: null,
            b: MidOpt{
                c: null,
                d: InnerOpt{
                    e: null,
                },
            },
        };
    }
}