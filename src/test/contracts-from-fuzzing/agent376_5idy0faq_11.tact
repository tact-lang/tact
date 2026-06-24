struct InnerS {
    foo: Int;
}

struct MidS {
    inner: InnerS;
    s: String;
}

struct TopS {
    a: Int;
    mid: MidS;
}

contract NestedDeeply {
    val: TopS;

    init() {
        self.val = TopS{
            a: 10,
            mid: MidS{
                inner: InnerS{ foo: 20 },
                s: "str",
            },
        };
    }
}