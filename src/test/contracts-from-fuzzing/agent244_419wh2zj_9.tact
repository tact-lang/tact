struct SubLevel {
    a: Int;
    b: Bool;
}

struct MidLevel {
    m: String;
    sub: SubLevel;
}

struct TopLevel {
    t: MidLevel;
    u: Bool;
}

contract MixNested {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            t: MidLevel{
                m: "str",
                sub: SubLevel{
                    a: 5,
                    b: true,
                }
            },
            u: false,
        };
    }
}