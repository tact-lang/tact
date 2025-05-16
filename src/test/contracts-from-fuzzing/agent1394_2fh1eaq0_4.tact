struct InnerMost {
    x: Int;
    y: Bool;
}

struct Middle {
    im: InnerMost;
}

struct Outer {
    m: Middle;
}

contract DeepChain {
    chain: Outer;

    init() {
        self.chain = Outer{
            m: Middle{
                im: InnerMost{
                    x: 77,
                    y: true
                }
            }
        };
    }
}