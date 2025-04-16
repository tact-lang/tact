struct DeepNested {
    x: Int;
    y: Bool;
}

struct MidNested {
    dn: DeepNested;
    flag: Bool;
}

struct TopNested {
    mid: MidNested;
    count: Int;
}

contract TestContract {
    top: TopNested = TopNested{
        mid: MidNested{
            dn: DeepNested{
                x: 42,
                y: false
            },
            flag: true
        },
        count: 7
    };
}