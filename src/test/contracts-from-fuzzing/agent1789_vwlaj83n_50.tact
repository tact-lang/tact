struct InnerMost {
    x: Int;
}

struct MidNested {
    a: Bool;
    b: InnerMost;
}

struct TopMost {
    y: MidNested;
}

contract NestedComb {
    rec: TopMost;

    init() {
        self.rec = TopMost{
            y: MidNested{
                a: true,
                b: InnerMost{ x:99 }
            }
        };
    }
}