struct DeeplyNested {
    s1: String;
    s2: String;
}

struct MidNested {
    dn: DeeplyNested;
    value: Int;
}

struct TopNested {
    mn: MidNested;
    flag: Bool;
}

contract TestDeeper {
    record: TopNested;

    init() {
        self.record = TopNested{
            mn: MidNested {
                dn: DeeplyNested{
                    s1: "x", s2: "y"
                },
                value: 42
            },
            flag: false
        };
    }
}