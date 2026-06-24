struct DeeplyNested {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
}

struct MiddleNested {
    nested: DeeplyNested;
    extra: Bool;
    optStr: String?;
}

struct TopNested {
    mid: MiddleNested;
    flag: Bool;
}

contract LotsOfLayers {
    top: TopNested;

    init() {
        self.top = TopNested{
            mid: MiddleNested{
                nested: DeeplyNested{ a:1, b:"x", c:true, d:null },
                extra: false,
                optStr: null,
            },
            flag: true,
        };
    }
}
