// Optional nested chain with defaults in inner
struct InnerMost {
    iv: Int = 5;
}

struct OuterOpt {
    inner: InnerMost?;
}

struct TopChain {
    outer: OuterOpt?;
}

contract DefaultOptChain {
    root: TopChain;

    init() {
        self.root = TopChain{
            outer: OuterOpt{
                inner: InnerMost{}
            }
        };
    }
}