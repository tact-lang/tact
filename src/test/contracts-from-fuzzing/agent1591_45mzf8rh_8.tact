struct InnerMost {
    flag: Bool;
}

struct InnerMid {
    flag: Bool;
    nested: InnerMost;
}

struct InnerTop {
    nested: InnerMid;
    optStr: String?;
}

contract DeepOptionals {
    content: InnerTop;

    init() {
        self.content = InnerTop{
            nested: InnerMid{
                flag: true,
                nested: InnerMost{ flag: false }
            },
            optStr: null
        };
    }
}