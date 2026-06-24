struct DeeplyNested {
    x: Int;
    y: Bool;
    z: String;
}

struct MidNested {
    dn: DeeplyNested;
    val: Int;
}

struct TopLevel {
    mid: MidNested;
    flag: Bool;
}

contract VeryDeepNest {
    top: TopLevel;

    init() {
        self.top = TopLevel{
            mid: MidNested{
                dn: DeeplyNested{
                    x: 3,
                    y: false,
                    z: "z",
                },
                val: 7,
            },
            flag: true,
        };
    }
}
