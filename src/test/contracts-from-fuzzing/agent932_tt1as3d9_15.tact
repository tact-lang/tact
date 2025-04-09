struct Bottom {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
}

struct MidLevel {
    inner: Bottom;
}

struct TopLevel {
    next: MidLevel;
}

contract DeepOptionalMix {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            next: MidLevel{
                inner: Bottom{
                    a: 5,
                    b: null,
                    c: true,
                    d: null,
                },
            },
        };
    }
}