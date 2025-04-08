struct InnerMost { z: String; }
struct Middle {
    m1: InnerMost;
    m2: String?;
}
struct Outermost {
    out1: Middle;
    out2: Int;
}

contract DeeplyNestedOptions {
    nest: Outermost;
    init() {
        self.nest = Outermost{
            out1: Middle{
                m1: InnerMost{z:"bar"},
                m2: null
            },
            out2: 5
        };
    }
}