struct DeepNested {
    i: Int;
    b: Bool;
}

struct MidNested {
    d: DeepNested;
    flag: Bool;
}

struct Top {
    m: MidNested;
    number: Int;
}

contract ComplexContract {
    state: Top;

    init() {
        self.state = Top{
            m: MidNested{
                d: DeepNested{
                    i: 1,
                    b: false,
                },
                flag: true,
            },
            number: 42,
        };
    }
}