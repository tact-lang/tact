struct InnerMost {
    value: Int;
}

struct InnerMiddle {
    im: InnerMost;
    flag: Bool;
}

struct InnerOuter {
    mid: InnerMiddle;
    text: String;
}

contract DeepNested {
    deep: InnerOuter;
    init() {
        self.deep = InnerOuter{
            mid: InnerMiddle{
                im: InnerMost{value: 32},
                flag: true
            },
            text: "deep"
        };
    }
}