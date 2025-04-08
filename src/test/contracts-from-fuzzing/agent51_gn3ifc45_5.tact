struct InnerMost {
    flag: Bool;
}

struct Middle {
    nested: InnerMost?;
}

struct Outer {
    container: Middle?;
}

contract OptionChain {
    data: Outer;
    init() {
        self.data = Outer{
            container: Middle{ nested: InnerMost{ flag: true } }
        };
    }
}
