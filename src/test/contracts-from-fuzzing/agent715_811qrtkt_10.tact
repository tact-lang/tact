struct InnerMost {
    a: Int;
    b: String;
}

struct Middle {
    nested: InnerMost?;
    flag: Bool;
}

struct OuterOpt {
    mid: Middle?;
    name: String;
}

contract OptChain {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            mid: null,
            name: "ok"
        };
    }
}