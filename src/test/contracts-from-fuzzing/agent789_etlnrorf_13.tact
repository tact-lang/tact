struct InnerMost {
    x: Int;
}

struct InnerOpt {
    x: InnerMost?;
}

struct MidOpt {
    innerOpt: InnerOpt?;
}

struct OuterOpt {
    midOpt: MidOpt?;
}

contract ChainOfOptionals {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{
            midOpt: MidOpt{
                innerOpt: InnerOpt{
                    x: InnerMost{
                        x: 1
                    }
                }
            }
        };
    }
}